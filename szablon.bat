@echo off
chcp 65001 > nul
title PRZYGOTOWANIE STANOWISKA EGZAMINACYJNEGO

echo ===================================================
echo    AUTOMATYCZNE TWORZENIE ŚRODOWISKA DLA UCZNIA
echo ===================================================

set "target_dir=%~dp0backend"

if exist "%target_dir%" (
    echo [INFO] Folder "backend" już istnieje. Czyszczenie zawartości...
    rmdir /s /q "%target_dir%"
    )
mkdir "%target_dir%"
echo [OK] Utworzono czysty katalog: backend

cd /d "%target_dir%"

echo [OK] Generowanie domyślnego package.json...
call npm init -y > nul

echo [OK] Pobieranie i instalacja modułów z npm (wersje online)...
echo To może chwilę potrwać, proszę czekać...

call npm install express mongoose ejs mysql2 dotenv bcrypt express-session mysql express-ejs-layouts cookie-parser nodemon

echo ===================================================
echo [SUKCES] Stanowisko gotowe. Moduły dopasowane do systemu.
echo ===================================================
timeout /t 3 > nul
exit