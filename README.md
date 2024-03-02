# Project-Phoenix-Install

## Lisence
![License-MIT](https://img.shields.io/badge/License-MIT-blue.svg) 

## Current OS Compatibility 
![Windows](https://img.shields.io/badge/Windows-0078D6?style=for-the-badge&logo=windows&logoColor=white) ![Ubuntu](https://img.shields.io/badge/Ubuntu-E95420?style=for-the-badge&logo=ubuntu&logoColor=white) ![Debian](https://img.shields.io/badge/Debian-D70A53?style=for-the-badge&logo=debian&logoColor=white) ![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)
## Languages coded in
![PowerShell](https://img.shields.io/badge/PowerShell-%235391FE.svg?style=for-the-badge&logo=powershell&logoColor=white) ![Shell Script](https://img.shields.io/badge/shell_script-%23121011.svg?style=for-the-badge&logo=gnu-bash&logoColor=white)

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
