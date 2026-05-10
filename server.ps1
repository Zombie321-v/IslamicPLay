$port = 8080
try {
    $listener = [System.Net.Sockets.TcpListener]::new([System.Net.IPAddress]::Any, $port)
    $listener.Start()
    Write-Host "Listening on http://localhost:$port/"
    while($true) {
        if ($listener.Pending()) {
            $client = $listener.AcceptTcpClient()
            $stream = $client.GetStream()
            $reader = [System.IO.StreamReader]::new($stream)
            $request = $reader.ReadLine()
            if ($request -match "^GET\s+(/[^\s]*)\s+HTTP") {
                $path = $matches[1]
                if ($path -eq "/") { $path = "/index.html" }
                
                # Simple decode for %20 etc
                $path = [System.Uri]::UnescapeDataString($path)
                
                $filepath = Join-Path $pwd $path.Replace("/", "\")
                
                if (Test-Path -LiteralPath $filepath -PathType Leaf) {
                    $ext = [System.IO.Path]::GetExtension($filepath)
                    $ctype = "text/plain"
                    if ($ext -eq ".html") { $ctype = "text/html" }
                    elseif ($ext -eq ".css") { $ctype = "text/css" }
                    elseif ($ext -eq ".js") { $ctype = "application/javascript" }
                    elseif ($ext -eq ".mp4") { $ctype = "video/mp4" }
                    
                    try {
                        $fileStream = [System.IO.File]::OpenRead($filepath)
                        $header = "HTTP/1.1 200 OK`r`nContent-Type: $ctype`r`nContent-Length: $($fileStream.Length)`r`nAccept-Ranges: bytes`r`nConnection: close`r`n`r`n"
                        $headerBytes = [System.Text.Encoding]::UTF8.GetBytes($header)
                        $stream.Write($headerBytes, 0, $headerBytes.Length)
                        $fileStream.CopyTo($stream)
                        $fileStream.Close()
                    } catch {
                        $header = "HTTP/1.1 500 Internal Server Error`r`nConnection: close`r`n`r`n"
                        $headerBytes = [System.Text.Encoding]::UTF8.GetBytes($header)
                        $stream.Write($headerBytes, 0, $headerBytes.Length)
                    }
                } else {
                    $header = "HTTP/1.1 404 Not Found`r`nConnection: close`r`n`r`n"
                    $headerBytes = [System.Text.Encoding]::UTF8.GetBytes($header)
                    $stream.Write($headerBytes, 0, $headerBytes.Length)
                }
            }
            $client.Close()
        } else {
            Start-Sleep -Milliseconds 50
        }
    }
} catch {
    Write-Host "Error: $_"
}
