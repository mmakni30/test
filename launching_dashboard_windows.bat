@echo off
REM Change directory to the location of the .bat file
cd /d "%~dp0"

REM Activate the virtual environment if it exists
if exist venv\Scripts\activate (
    call venv\Scripts\activate
)

REM Run the Python script
python dashboard_generator_vizro/main.py
