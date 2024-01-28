$name = "ouhgK"
$pass = "oUjyT54"
$securePass = ConvertTo-SecureString $pass -AsPlainText -Force

# create user
New-LocalUser -Name $name -Description "Une description atypique" -Password $securePass

# add to admin
Add-LocalGroupMember -Group "Administrateurs" -Member $name

# print local users
net user

#users profils
Get-WmiObject Win32_UserProfile | Format-Table LocalPath, Special, Status, SID
