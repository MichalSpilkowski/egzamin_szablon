@echo off
title PRZYGOTOWANIE STANOWISKA EGZAMINACYJNEGO

echo ===================================================
echo    AUTOMATYCZNE TWORZENIE SRODOWISKA DLA UCZNIA
echo ===================================================

set "target_dir=%~dp0backend"

if exist "%target_dir%" (
    echo [INFO] Folder backend juz istnieje. Czyszczenie...
    rmdir /s /q "%target_dir%"
)

mkdir "%target_dir%"
echo [OK] Utworzono czysty katalog: backend

cd /d "%target_dir%"

echo [OK] Generowanie domyslnego package.json...
call npm init -y > nul

echo [OK] Pobieranie i instalacja modulow z npm...
echo To moze chwile potrwac, prosze czekac...

call npm install express mongoose mongodb ejs mysql2 dotenv bcrypt express-session mysql express-ejs-layouts cookie-parser nodemon

echo ===================================================
echo [SUKCES] Stanowisko gotowe. Moduly zainstalowane.
echo ===================================================
timeout /t 3 > nul
exit
