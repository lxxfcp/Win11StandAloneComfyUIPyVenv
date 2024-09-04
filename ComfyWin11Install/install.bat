:: Stripts to install ComfyUI in a py venv
:: Author:fpliu

:: Let's check dependencies first
python --version 2>NUL
if errorlevel 1 goto errorNoPython

git --version 2>NULL
if errorlevel 1 goto errorNoGit

:: Installing ComfyUI
echo ">>>>>>>> Starting getting ComfyUI..."
git clone https://github.com/comfyanonymous/ComfyUI.git
echo ">>>>>>>> Starting getting ComfyUI manager..."
cd ComfyUI/custom_nodes
git clone https://github.com/ltdrdata/ComfyUI-Manager
cd ..

echo ">>>>>>>> Making venv..."
python -m venv .venv --prompt "ComfyUI"
call .venv/Scripts/activate

echo ">>>>>>>> We have the following environment as base, press any key to start installing dependencies..."
python -c "import sys; print(sys.prefix)"
pause

echo ">>>>>>>> Installing dependencies..."
python -m pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu121
python -m pip install -r requirements.txt
python -m pip install -r custom_nodes/ComfyUI-Manager/requirements.txt

:: Install numpy lower version to be compatible. Put other incompatible versions in this section.
python -m pip install numpy==1.26.3


cd ..
echo cd ComfyUI > start.bat
echo call .venv/Scripts/activate >> start.bat
echo echo ">>>>>>>> Running ComfyUI with venv in >>>>>>>>>>" >> start.bat
echo python -c "import sys; print(sys.prefix)" >> start.bat
echo python main.py --listen 0.0.0.0 --auto-launch >> start.bat
echo pause >> start.bat

echo ">>>>>>>> Installing finished. Please use the start.bat to start ComfyUI. Enjoy!"
pause
goto:eof

:errorNoPython
echo.
echo Error^: Python is not installed. Please refer to README.md for prerequisite details.
goto:eof

:errorNoGit
echo.
echo Error^: Git is not installed. Please refer to README.md for prerequisite details.
goto:eof
