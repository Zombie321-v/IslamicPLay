$code1 = Get-Content "code.html" -Raw
$code2 = Get-Content "code2.html" -Raw
$hero  = Get-Content "hero_template.html" -Raw

# Helper to extract using start/end markers
function Get-InnerContent {
    param([string]$text, [string]$startTag, [string]$endTag)
    $startIdx = $text.IndexOf($startTag)
    if ($startIdx -eq -1) { return "" }
    $startIdx += $startTag.Length
    $endIdx = $text.IndexOf($endTag, $startIdx)
    if ($endIdx -eq -1) { return "" }
    return $text.Substring($startIdx, $endIdx - $startIdx)
}

# 1. CSS Extraction
$css1 = Get-InnerContent $code1 "<style>" "</style>"
$css1 = $css1 -replace '(?s)body \{.*?\}', ''
$css1 = $css1 -replace '(?s)\.material-symbols-outlined \{.*?\}', ''

$css2 = Get-InnerContent $code2 "<style>" "</style>"
$css2 = $css2 -replace '(?s)\.material-symbols-outlined \{.*?\}', ''

$combinedCss = $css1 + "`n" + $css2

# 2. Extract Body parts
# code1 main
$main1 = Get-InnerContent $code1 "<!-- Hero Section -->" "<!-- Footer -->"
$main1 = "<!-- Hero Section -->" + $main1

# code2 main
$main2 = Get-InnerContent $code2 "<!-- Hero Section -->" "<!-- Footer -->"
$main2 = "<!-- Hero Section -->" + $main2

# code2 footer
$footer = Get-InnerContent $code2 "<!-- Footer -->" "</body>"
$footer = "<!-- Footer -->" + $footer

# Add reveal-on-scroll classes to both sections
$main1 = $main1 -replace '<section class="', '<section class="reveal-on-scroll '
$main1 = $main1 -replace 'class="glass-card ', 'class="glass-card reveal-on-scroll '

$main2 = $main2 -replace '<section class="', '<section class="reveal-on-scroll '
$main2 = $main2 -replace 'class="glass-card ', 'class="glass-card reveal-on-scroll '

$footer = $footer -replace '<footer class="', '<footer class="reveal-on-scroll '

# Wrap Quran 1 inside an anchor wrapper
$combinedBody = @"
<main class="relative z-10 bg-surface overflow-x-hidden">
<div id="quran1-content" class="quran-section active-section">
$main1
</div>
<div id="quran2-content" class="quran-section">
$main2
</div>
</main>
$footer
"@

# 3. Inject
$hero = $hero.Replace("<!-- INJECT_CSS -->", $combinedCss)
$hero = $hero.Replace("<!-- INJECT_BODY -->", $combinedBody)

Set-Content "index.html" $hero
