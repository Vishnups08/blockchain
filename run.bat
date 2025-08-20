@echo off
chcp 65001 >nul
title Blockchain Java Examples - Auto Setup and Run

echo 🚀 Blockchain Java Examples - Auto Setup and Run
echo ================================================

REM Check if Java is installed
echo [INFO] Checking Java installation...
java -version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Java is not installed or not in PATH
    echo Please install Java 8 or higher from:
    echo   - Oracle: https://www.oracle.com/java/technologies/downloads/
    echo   - OpenJDK: https://openjdk.java.net/
    pause
    exit /b 1
)

echo [SUCCESS] Java detected
echo.

REM Download Java files (you'll need to update these URLs)
echo [INFO] Checking for Java blockchain examples...
set FILES=five.java three.java four.java two.java one.java

for %%f in (%FILES%) do (
    if exist "%%f" (
        echo [WARNING] File %%f already exists, skipping download
    ) else (
        echo [INFO] File %%f not found
        echo [WARNING] Please manually download %%f or update the script with correct URLs
    )
)

echo.

REM Compile Java files
echo [INFO] Compiling Java files...
javac *.java
if %errorlevel% neq 0 (
    echo [ERROR] Compilation failed
    pause
    exit /b 1
)

echo [SUCCESS] All Java files compiled successfully
echo.

REM Run all examples
echo 🎯 Running Blockchain Examples
echo ==============================

REM Run each program
echo.
echo 🔹 Running five (BlockchainWallet)...
echo ----------------------------------------
java five
echo ----------------------------------------
timeout /t 2 >nul

echo.
echo 🔹 Running three (SimpleBlockchain)...
echo ----------------------------------------
java three
echo ----------------------------------------
timeout /t 2 >nul

echo.
echo 🔹 Running four (TransactionVerification)...
echo ----------------------------------------
java four
echo ----------------------------------------
timeout /t 2 >nul

echo.
echo 🔹 Running two (SHA256Example)...
echo ----------------------------------------
java two
echo ----------------------------------------
timeout /t 2 >nul

echo.
echo 🔹 Running one (RSADemo)...
echo ----------------------------------------
java one
echo ----------------------------------------

echo.
echo [SUCCESS] All blockchain examples completed!
echo.
echo 📁 Generated files:
dir *.class 2>nul
echo.
echo 🧹 To clean up generated files, run: make clean
echo.
pause 