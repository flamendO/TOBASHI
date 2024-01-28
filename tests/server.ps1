Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0 # Ajoute un package de fonctionnalités au systeme d'exploitation EN COURS D'EXECUTION source : OpenSSH
Start-Service sshd
Set-Service -Name sshd -StartupType 'Automatic'

Read-Host

Stop-Service -Name sshd
