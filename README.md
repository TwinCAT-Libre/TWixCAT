# TWixCAT
Combining the power of [Wix](https://wixtoolset.org/) ([github](https://github.com/wixtoolset)) and [TwinCAT](https://www.beckhoff.com/en-us/products/automation/twincat/)!

## What is this?
This project shows you how to use Wix to create Windows installers for your TwinCAT PLC and HMI projects to provide cleaner, fool-proof ways to transfer projects ([File Level Machine Update](https://infosys.beckhoff.com/english.php?content=../content/1033/machineupdate/index.html&id=2281025263805392133)) to your machines that anyone can perform. 

### What is Wix?
Simply put, it makes all those fancy installers you've used when you had to install software on your computer. 



## Setup

### Requirements
* Familiarity with TwinCAT project file structures and have performed updates (for TE2000 and PLC) in the traditional way
* Your PLC project is configured for [file level updates](https://infosys.beckhoff.com/english.php?content=../content/1033/machineupdate/6137492619.html&id=6453043249580970735). (Not entirely neccesary, but will reduce headaches)
* The project does not use C++
* The destination system is 64 bit Windows
  * 32 bit is untested at this time
* TF2000 should be installed locally on your development machine

### Installation and Usage
This assumes you have TwinCAT3 and a version of Visual Studio already installed.

1. Download latest version 3 release of [Wix](https://wixtoolset.org/releases/)
1. Download and install the appropriate version Visual Studio [extension](https://wixtoolset.org/releases/)
1. Copy the folder for the installer from this repo into your solution folder and add it to existing -or-
1. In an existing or new solution add a new project using the `Setup Project for Wix v3` template and manually change/create the required wix files
2. Modify the entries in the `Configuration.wxi`. 
3. Plase any relevant image files and licesnes in the `resources` folder of the Wix project to be displayed during the install process
4. Change the Harvestpath in the `.wixproj` file to match your solution name
> You will have to modify the HarvestPath and replace PLC-Wix with your TwinCAT Solution folder name
> ```<HeatDirectory Directory="..\```**PLC-Wix**```\_Boot\TwinCAT RT (x64)\....."```

## Explanations

### Configuration.wxi
Here, you set the basic descriptions and information for your project. This information is what will appear in the Windows installed programs list. 

![InstalledProgram](/imgs/Installed.jpg)

### Product.wxs
The meat and potatoes of the what the installer does. This tells it how to behave when there are version mismatches, what files to copy over and where to place them, what registries to change, etc. 

### UI.wxi
What pages and prompts to display to the user when running an installer. 


### HeatExclude.xslt
This file tells Wix what files not to copy when making an installer.

### HMI_Files.wxs and PLC_Files.wxs
A generated list of files that are compiled into the windows installer for transfer during install. This will update each time you build the installer and prompt you to reload. This is normal. 

## Q&A

### How does heat auto generate the file list?
Pure magic! No, in Visual Studio you cant see where any of this information is set. You have to open the `.wixproj` file in a text editor to see where this is configured. Check out the last lines of the `Installer-HMI/PLC.wixproj` to see where and how files are harvested. 


## Future Things
* Get version out of the GVLs into the wxi so it only has to be set in one place
* Trigger PLC project build automatically when building installer
  * Likely using powershell scripts? c#?
* Do backups without powershell?
* Selectable installation options
  * backup, autostart registry
* 32 bit compliation differences






