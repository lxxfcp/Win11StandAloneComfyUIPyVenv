# Install ComfyUI in Isolated Python venv in Windows 11

<owner fpliu>

## What's this?
This is a script for installing ComfyUI in a python venv in Windows 11. So this will not mess up with your other environment.  Uninstallation cleanly is simply removing the ComfyUI folder.

## How to use this tool
Download this code zip or simply `git clone` this repo. Then follow the instruction below. 

If you already have python and git installed. You can directly put `install.bat` into the directory you wish to have your ComfyUI. Then run `install.bat` (just double click)


> **_NOTE:_** You need to use Windows for this installation instruction.

## Prerequisites:

1. Install Python

    https://www.python.org/downloads/

    When you successfully install python, you should be able to see the python version with the following command

    ```
    $ python --version
    Python 3.11.9
    ```

1. Get Git

    Use Microsoft store to install git and git tools.
    After installation, make sure you have git in power shell. Run following:
    ```
    $ get-command git
    ```
    you should be able to see git.exe. For example
    ```
    CommandType     Name                   Version    Source
    -----------     ----                   -------    ------
    Application     git.exe                2.44.0.1   C:\Program Files\Git\cmd\git.exe
    ```


## Steps to install ComfyUI

1. Create a folder you prefer to put ComfyUI (anywhere you would like). Navigate to the folder, copy `install.bat` into the folder
1. Run `install.bat` (double click) and wait for it to finish. You need to keep an eye on the errors. If it run successfully, it should create a `start.bat` file.
1. Run `start.bat` (double click), it will start ComfyUI server and open a browser tab.


## How to get started in ComfyUI

Once you see your ComfyUI from browser, you need to get you first model to be able to generate.
1. Go to your ComfyUI at [127.0.0.1:8118](http://127.0.0.1:8188/)
1. Click on "Manager" on the right side panel. And in the window, in the middle column, "Model Manager"
1. In the "Type" drop-down, choose "checkpoint". Below are some good models to get started with:

    model name | model size
    ---|---
    SDXL turbo | ~6G
    SD3 | ~ 16G
    FLUX (dev/schnell) | ~24G

1. Install the model. You may need to refresh or restart. Use the manager to do it for you. 
1. In the default workflow, in the checkpoint node, load SDXL model and click on the "Queue Prompt" on the right side to start generating. 
    > **_NOTE:_** Sometimes model name may not match the workflow default. You can manually pick one in the checkpoint drop-down.
    
    > **_NOTE:_** If you want to try SD3 or FLUX, use the two basic workflows in this package. Simply drag the PNG picture to the ComfyUI page in your browser. For more workflow, check out [ComfyUI official examples](https://github.com/comfyanonymous/ComfyUI_examples/tree/master)



## Access remotely from different device (e.g. ipad)

> **_NOTE:_** You need this device to be in the same local network, otherwise you need to config public IP.


1. On the machine where your ComfyUI is running, get the internal IPAdress of the machine. You can use `Get-NetIPAddress -InterfaceIndex 6` to find it. Usually it starts with "192..." or "172..." or "10..." depends on your IPv4 classes.

1. Suppose {ComfyUI_IP} is the ip you find in above step, on a different device in the same network, in browser, go to {ComfyUI_IP}:8188 You should be able to generate image from there.


## How to uninstall?

Simply put the folder you created for ComfyUI to the recycle bin it'll be deleted cleanly ¯\\_(ツ)_/¯

However, you need to uninstall python and git by hand, if you don't need them any longer.
