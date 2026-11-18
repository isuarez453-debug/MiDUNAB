@echo off
REM Compila y ejecuta MiDUNAB sin Maven (solo necesita el JDK 17 o superior).
REM Uso: doble clic en ejecutar.bat o escribir ejecutar.bat en la consola.
cd /d "%~dp0"
if exist out rmdir /s /q out
mkdir out
REM -sourcepath compila Main.java y todas las clases que usa (funciona aunque la ruta tenga espacios o tildes)
javac -encoding UTF-8 -d out -sourcepath src\main\java src\main\java\co\edu\unab\midunab\Main.java
if errorlevel 1 (
  echo No se pudo compilar. Revisa que tengas instalado el JDK 17 o superior.
  pause
  exit /b 1
)
xcopy src\main\resources out /E /I /Y /Q > nul
java -cp out co.edu.unab.midunab.Main
if errorlevel 1 pause
