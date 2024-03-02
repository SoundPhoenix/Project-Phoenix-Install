Here is the equivalent PowerShell script based on the provided Bash script:

```powershell
Write-Host "
# # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#           Project Phoenix Installation Script         #
#       This Script only works on Powershell            #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # #
" -ForegroundColor Green

# Check if user is Powershell
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) {
    Write-Host "* This script must be executed via Powershell user." -ForegroundColor Green
    exit 1
}

# Function for Bare Linux options
function BareLinuxOptions {
    while ($true) {
        $Reset = "`e[0m"
        $Green = "`e[32m"
        $choice = Read-Host -Prompt "$(Write-Host "$Green`n* Bare Linux Options:`n1. Install/Update`n2. Start`n3. Restart`n4. Stop`n5. Exit`nEnter your choice: $Reset")"
        switch ($choice) {
            1 {
                Write-Host "* Installing dependencies.." -ForegroundColor Green
                sudo apt update > $null 2>&1

                # Install Curl
                if (-not (Test-Path $(Get-Command -Name "curl" -ErrorAction SilentlyContinue))) {
                    Write-Host "* Installing curl." -ForegroundColor Green
                    sudo apt install -y curl > $null 2>&1
                }

                # Install NodeJS
                if (-not (Test-Path $(Get-Command -Name "node" -ErrorAction SilentlyContinue))) {
                    Write-Host "* Installing NodeJS" -ForegroundColor Green
                    curl -sL https://deb.nodesource.com/setup_18.x | sudo -E bash - > $null 2>&1; sudo apt install -y nodejs > $null 2>&1
                }

                # Install Git
                if (-not (Test-Path $(Get-Command -Name "git" -ErrorAction SilentlyContinue))) {
                    Write-Host "* Installing git." -ForegroundColor Green
                    sudo apt install -y git > $null 2>&1
                }

                # Install Pm2
                if (-not (Test-Path $(Get-Command -Name "pm2" -ErrorAction SilentlyContinue))) {
                    Write-Host "* Installing pm2." -ForegroundColor Green
                    sudo npm install pm2 -g > $null 2>&1
                }

                # Install Project Phoenix app
                Write-Host "* Starting Installation" -ForegroundColor Green
                # Prompt user for the directory to install the bot
                Write-Host "* Please enter the directory where you want to install the bot" -ForegroundColor Green
                $install_dir = Read-Host "* Directory path:"
                # Check if the directory exists
                if (-not (Test-Path -Path $install_dir -PathType Container)) {
                    Write-Host "* Directory doesn't exist or is invalid. Exiting." -ForegroundColor Green
                    exit 1
                }

                # Change to the specified directory
                Write-Host "* Switching to the specified directory: $install_dir" -ForegroundColor Green
                Set-Location -Path $install_dir -ErrorAction Stop
                Remove-Item -Path Project-Phoenix -Recurse -Force
                git clone https://github.com/soundphoenix428/Project-Phoenix > $null 2>&1
                Set-Location -Path "$install_dir/Project-Phoenix" -ErrorAction Stop
                npm install > $null 2>&1
                Write-Host "* Installation Completed" -ForegroundColor Green

                # Start Project Phoenix
                Set-Location -Path "$install_dir/Project-Phoenix/config" -ErrorAction Stop
                # Prompt the user for values
                $dev_id = Read-Host "Enter developer ID: "
                $bot_id = Read-Host "Enter bot ID: "
                $bot_token = Read-Host "Enter bot token: "
                # Remove the old example files if they exist
                Remove-Item -Path config.example.json, debug.example.json, bot-sites.example.json -Force

                # Overwrite config.json
                @"
{
    "developers": ["$dev_id"],
    "client": {
        "id": "$bot_id",
        "token": "$bot_token",
        "intents": [
            "Guilds",
            "GuildMessages",
            "GuildMessageReactions",
            "DirectMessages",
            "DirectMessageReactions"
        ],
        "partials": ["Message", "Channel", "Reaction"],
        "caches": {
            "BaseGuildEmojiManager": 0,
            "GuildBanManager": 0,
            "GuildInviteManager": 0,
            "GuildStickerManager": 0,
            "MessageManager": 0,
            "PresenceManager": 0,
            "StageInstanceManager": 0,
            "ThreadManager": 0,
            "ThreadMemberManager": 0,
            "VoiceStateManager": 0
        }
    },
    "api": {
        "port": 3001,
        "secret": "00000000-0000-0000-0000-000000000000"
    },
    "sharding": {
        "spawnDelay": 5,
        "spawnTimeout": 300,
        "serversPerShard": 1000
    },
    "clustering": {
        "enabled": false,
        "shardCount": 16,
        "callbackUrl": "http://localhost:3001/",
        "masterApi": {
            "url": "http://localhost:5000/",
            "token": "00000000-0000-0000-0000-000000000000"
        }
    },
    "jobs": {
        "updateServerCount": {
            "schedule": "*/10 * * * *",
            "log": true
        }
    },
    "rateLimiting": {
        "commands": {
            "amount": 10,
            "interval": 30
        },
        "buttons": {
            "amount": 10,
            "interval": 30
        },
        "triggers": {
            "amount": 10,
            "interval": 30
        },
        "reactions": {
            "amount": 10,
            "interval": 30
        }
    },
    "logging": {
        "pretty": true,
        "rateLimit": {
            "minTimeout": 30
        }
    }
}
"@ | Out-File -FilePath config.json -Encoding utf8 -Force

                # Overwrite debug.json
                @"
{
    "override": {
        "shardMode": {
            "enabled": false,
            "value": "worker"
        }
    },
    "dummyMode": {
        "enabled": false,
        "whitelist": ["212772875793334272", "478288246858711040"]
    }
}
"@ | Out-File -FilePath debug.json -Encoding utf8 -Force

                @"
[
    {


        "name": "top.gg",
        "enabled": false,
        "url": "https://top.gg/api/bots/<BOT_ID>/stats",
        "authorization": "<TOKEN>",
        "body": "{\"server_count\":{{SERVER_COUNT}}}"
    },
    {
        "name": "bots.ondiscord.xyz",
        "enabled": false,
        "url": "https://bots.ondiscord.xyz/bot-api/bots/<BOT_ID>/guilds",
        "authorization": "<TOKEN>",
        "body": "{\"guildCount\":{{SERVER_COUNT}}}"
    },
    {
        "name": "discord.bots.gg",
        "enabled": false,
        "url": "https://discord.bots.gg/api/v1/bots/<BOT_ID>/stats",
        "authorization": "<TOKEN>",
        "body": "{\"guildCount\":{{SERVER_COUNT}}}"
    },
    {
        "name": "discordbotlist.com",
        "enabled": false,
        "url": "https://discordbotlist.com/api/bots/<BOT_ID>/stats",
        "authorization": "Bot <TOKEN>",
        "body": "{\"guilds\":{{SERVER_COUNT}}}"
    },
    {
        "name": "bots.discordlabs.org",
        "enabled": false,
        "url": "https://bots.discordlabs.org/v2/bot/<BOT_ID>/stats",
        "authorization": null,
        "body": "{\"token\":\"discordlabs.org-<TOKEN>\",\"server_count\":\"{{SERVER_COUNT}}\"}"
    },
    {
        "name": "discords.com",
        "enabled": false,
        "url": "https://discords.com/bots/api/bot/<BOT_ID>",
        "authorization": "<TOKEN>",
        "body": "{\"server_count\":{{SERVER_COUNT}}}"
    },
    {
        "name": "disforge.com",
        "enabled": false,
        "url": "https://disforge.com/api/botstats/<BOT_ID>",
        "authorization": "<TOKEN>",
        "body": "{\"servers\":{{SERVER_COUNT}}}"
    }
]
"@ | Out-File -FilePath bot-sites.json -Encoding utf8 -Force

                sudo pm2 start "npm run start:manager" --name "Project-Phoenix"
                sudo pm2 startup
                sudo pm2 save
            }
            2 {
                sudo pm2 start "npm run start:manager" --name "Project-Phoenix"
            }
            3 {
                sudo pm2 restart "npm restart" --name "Project-Phoenix"
            }
            4 {
                sudo pm2 stop --name "Project-Phoenix"
            }
            5 {
                Write-Host "* Exiting Bare Linux Options Menu" -ForegroundColor Green
                exit
            }
            default {
                Write-Host "* Invalid option. Please choose a valid option." -ForegroundColor Green
            }
        }
    }
}

# Function for Docker Container options
function DockerContainerOptions {
    while ($true) {
        $Reset = "`e[0m"
        $Green = "`e[32m"
        $choice = Read-Host -Prompt "$(Write-Host "$Green`n* Docker Container Options:`n1. Install/Update`n2. Start`n3. Restart`n4. Stop`n5. Exit`nEnter your choice: $Reset")"
        switch ($choice) {
            1 {
                Write-Host "* You chose to Install/Update" -ForegroundColor Green # Add your Install/Update logic here
            }
            2 {
                Write-Host "* You chose to Start" -ForegroundColor Green # Add your Start logic here
            }
            3 {
                Write-Host "* You chose to Restart" -ForegroundColor Green # Add your Restart logic here
            }
            4 {
                Write-Host "* You chose to Stop" -ForegroundColor Green # Add your Stop logic here
            }
            5 {
                Write-Host "* Exiting Docker Container Options Menu" -ForegroundColor Green
                exit
            }
            default {
                Write-Host "* Invalid option. Please choose a valid option." -ForegroundColor Green
            }
        }
    }
}

# Main menu
while ($true) {
    $Reset = "`e[0m"
    $Green = "`e[32m"
    $option = Read-Host -Prompt "$(Write-Host "$Green`n* Main Menu:`n1. Bare Linux`n2. Docker Container`n3. Exit`nEnter your choice: $Reset")"
    switch ($option) {
        1 {
            Write-Host "* You chose Bare Linux" -ForegroundColor Green
            BareLinuxOptions
        }
        2 {
            Write-Host "* You chose Docker Container" -ForegroundColor Green
            DockerContainerOptions
        }
        3 {
            Write-Host "* Exiting the Installation Script" -ForegroundColor Green
            exit
        }
        default {
            Write-Host "* Invalid option. Please choose a valid option." -ForegroundColor Green
        }
    }
}
```

# This script was made by Tanner Schermerhorn (me@tannerschermerhorn.dev)