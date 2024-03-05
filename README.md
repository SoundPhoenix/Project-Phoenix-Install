# Project-Phoenix-Install
[![License](https://img.shields.io/badge/license-MIT-blue)](https://opensource.org/licenses/MIT)
[![Stars](https://img.shields.io/github/stars/SoundPhoenix/Project-Phoenix-Install.svg)](https://github.com/KevinNovak/Discord-Bot-TypeScript-Template/stargazers)
[![Pull Requests](https://img.shields.io/badge/Pull%20Requests-Closed-red)](https://github.com/KevinNovak/Discord-Bot-TypeScript-Template/pulls)


## Current OS Compatibility 
![Windows](https://img.shields.io/badge/Windows-0078D6?style=for-the-badge&logo=windows&logoColor=white) ![Ubuntu](https://img.shields.io/badge/Ubuntu-E95420?style=for-the-badge&logo=ubuntu&logoColor=white) ![Debian](https://img.shields.io/badge/Debian-D70A53?style=for-the-badge&logo=debian&logoColor=white) ![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black) ![macOS](https://img.shields.io/badge/mac%20os-000000?style=for-the-badge&logo=macos&logoColor=F0F0F0)
## Languages coded in
![PowerShell](https://img.shields.io/badge/PowerShell-%235391FE.svg?style=for-the-badge&logo=powershell&logoColor=white) ![Shell Script](https://img.shields.io/badge/shell_script-%23121011.svg?style=for-the-badge&logo=gnu-bash&logoColor=white) ![Swift](https://img.shields.io/badge/swift-F54A2A?style=for-the-badge&logo=swift&logoColor=white)

## Installation for Linux Users

### Prerequisites
- Ubuntu, Debian or Linux operating system
- sudo privileges

### Installation Steps
- Clone the Repository:

`git clone https://github.com/soundphoenix428/Project-Phoenix.git`

- To Navigate to Project Directory use:

`cd Project-Phoenix`

### Run the Installation Script:

- Execute the installation script install.sh with sudo privileges.

`sudo bash install.sh`

### Follow On-screen Instructions:
## The installation script will prompt you for various inputs and perform the necessary setup steps. Follow the on-screen instructions to complete the installation.

- once installation is complete, you can start Project Phoenix using the provided commands.

`sudo pm2 start "npm run start:manager" --name "Project-Phoenix"`

## Additional Information
For detailed information on configuring Project Phoenix or troubleshooting common issues, refer to the Project Phoenix Documentation.
If you encounter any problems during the installation process, please check the FAQ section or open an issue on GitHub.

# For Windows users

## Prerequisites
- Windows operating system

- PowerShell (version 5.1 or higher)

## Installation Steps
### Clone the Repository:

- Open PowerShell and navigate to the directory where you want to install Project Phoenix. 

- Then, clone the repository using Git.

`git clone https://github.com/soundphoenix428/Project-Phoenix.git`

### Navigate to Project Directory:

- Change your current directory to the cloned Project Phoenix directory.

`cd .\Project-Phoenix\`

### Run the Installation Script:

- Execute the installation script install.ps1 using PowerShell.

`.\install.ps1`

### Follow On-screen Instructions:

## The installation script will prompt you for various inputs and perform the necessary setup steps. Follow the on-screen instructions to complete the installation.

## Start Project Phoenix:

- Once the installation is complete, you can start Project Phoenix using the provided commands.

`sudo pm2 start "npm run start:manager" --name "Project-Phoenix"`

## Running the PowerShell Script
To run the provided PowerShell script (install.ps1) through PowerShell, follow these steps:

- Open PowerShell:

- Open PowerShell with administrator privileges. Right-click on the PowerShell icon and select "Run as administrator."

## Change Execution Policy:

**If you haven't already, you may need to change the execution policy to allow running PowerShell scripts.**

## Execute the following command:

`Set-ExecutionPolicy RemoteSigned`

## Navigate to Project Directory:

- Change your current directory to the Project Phoenix directory where the install.ps1 script is located.

`cd .\Project-Phoenix\`

## Run the Script:

**Execute the PowerShell script using the .\ notation to specify the current directory.**

`.\install.ps1`

### Follow the on-screen instructions to complete the installation process.

## Additional Information
For detailed information on configuring Project Phoenix or troubleshooting common issues, refer to the Project Phoenix Documentation.
If you encounter any problems during the installation process, please check the FAQ section or open an issue on GitHub.

# For MacOS 

## Prerequisites
- Swift Insalled
- MacOS System

### Step 1: Prepare Your System

Ensure you have Swift installed on your macOS system. You can install Swift via Xcode or directly from the Swift.org website.

### Step 2: Create a Swift Script File

Open a text editor (such as TextEdit or Xcode) and copy the provided Swift script into a new file.

### Step 3: Save the Script File

Save the file with a `.swift` extension, for example, `installation_script.swift`.

### Step 4: Set Execute Permission (Optional)

If you want to execute the script directly from the Terminal without specifying the Swift interpreter, you'll need to give it execute permission. Open Terminal and navigate to the directory where you saved the script file. Then run the following command:

```bash
chmod +x installation_script.swift
```

### Step 5: Run the Script

#### Option 1: Run from Terminal

Open Terminal and navigate to the directory where you saved the script file. Then run the following command:

```bash
swift installation_script.swift
```

#### Option 2: Run by Double-clicking

Alternatively, you can run the script by double-clicking on the script file in Finder. This will automatically open Terminal and execute the script.

### Step 6: Follow Script Instructions

Follow the instructions provided by the script in Terminal. The script will present you with a menu of options for installation.

### Step 7: Proceed with Installation

Choose the appropriate options according to your requirements, such as selecting Bare Linux or Docker Container options.

### Step 8: Complete Installation

Once you've selected the desired options, the script will proceed with the installation process.

### Step 9: Verify Installation

After the script completes execution, verify that the installation was successful by checking the installed components or running the application as instructed.

### Step 10: Exit the Script

Once you've completed the installation and verified everything is working as expected, you can exit the script by following the on-screen instructions or closing the Terminal window.

That's it! You've successfully installed and run the Swift installation script on your macOS system.
