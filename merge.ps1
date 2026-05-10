$index = Get-Content "index.html" -Raw
$code = Get-Content "code.html" -Raw

# 1. Add Tailwind to index.html
$headAdd = @"
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@500;600;700&family=Montserrat:wght@400;600;700&family=Newsreader:opsz,wght@6..72,400&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
"@
$code -match '(?s)<script id="tailwind-config">(.*?)</script>' | Out-Null
$twConfig = "<script>`n" + $matches[1] + "`n</script>"
$headAdd += "`n" + $twConfig

$index = $index.Replace('<link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;600&family=Inter:wght@300;400;600&display=swap" rel="stylesheet">', 
    '<link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;600&family=Inter:wght@300;400;600&display=swap" rel="stylesheet">' + "`n" + $headAdd)

# 2. Add styles
$code -match '(?s)<style>(.*?)</style>' | Out-Null
$styles = $matches[1]
$styles = $styles -replace '(?s)body \{.*?\}', ''
$styles += @"
        .reveal-on-scroll { opacity: 0; transform: translateY(30px); transition: all 0.8s cubic-bezier(0.16, 1, 0.3, 1); }
        .reveal-on-scroll.revealed { opacity: 1; transform: translateY(0); }
"@
$index = $index.Replace('</style>', $styles + "`n    </style>")

# 3. Change body css
$index = $index -replace '(?s)body, html \{.*?color: white;\s*\}', @"
        body, html {
            margin: 0;
            padding: 0;
            width: 100%;
            background-color: #050505;
            font-family: 'Inter', sans-serif;
            overflow-x: hidden;
            color: white;
        }
"@

# 4. Wrap body content in <header>
$index = $index -replace '(?s)<body>(.*?)<script>', "<body>`n    <header class=`"relative w-full h-screen overflow-hidden`">`n`$1`n    </header>`n<script>"

# 5. Add <main> and <footer>
$code -match '(?s)<main.*?>(.*?)</main>' | Out-Null
$mainContent = "<main class=`"overflow-x-hidden relative z-10 bg-surface pb-24`">" + $matches[1] + "</main>"
$code -match '(?s)<footer.*?>(.*?)</footer>' | Out-Null
$footerContent = "<footer class=`"w-full mt-24 border-t border-secondary/10 bg-surface-container-lowest dark:bg-surface-container-lowest islamic-pattern bg-repeat opacity-90 relative z-10`">" + $matches[1] + "</footer>"

# Replace section and glass-card with reveal-on-scroll
$mainContent = $mainContent -replace '<section class="', '<section class="reveal-on-scroll '
$mainContent = $mainContent -replace 'class="glass-card ', 'class="glass-card reveal-on-scroll '
$footerContent = $footerContent -replace '<footer class="', '<footer class="reveal-on-scroll '

# Insert before <script>
$index = $index -replace '(?s)(<script>\s*document.addEventListener)', ($mainContent + "`n" + $footerContent + "`n`$1")

# Add IntersectionObserver to JS
$observerJS = @"
            const observer = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        entry.target.classList.add('revealed');
                    }
                });
            }, { threshold: 0.1, rootMargin: "0px 0px -50px 0px" });
            
            document.querySelectorAll('.reveal-on-scroll').forEach(el => observer.observe(el));
"@
$index = $index -replace '(?s)(document\.addEventListener\(''DOMContentLoaded'', \(\) => \{)', ("`$1`n" + $observerJS)

Set-Content "index.html" $index
