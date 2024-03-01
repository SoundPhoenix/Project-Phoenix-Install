set -e
echo -e "\e[32m
# # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#           Project Phoenix Installation Script         #
#       This Script only works on Ubuntu & Debian       #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # #\e[0m"

# Check if user is sudo
if [[ $EUID -ne 0 ]]; then
    echo -e "\e[32m* This script must be executed via sudo user. \e[0m" 1>&2
    exit 1
fi

# Function for Bare Linux options
bare_linux_options() {
    while true; do
        RESET="\e[0m"
        GREEN="\e[32m"
        read -p "$(echo -e $GREEN"\n* Bare Linux Options:\n1. Install/Update\n2. Start\n3. Restart\n4. Stop\n5. Exit\nEnter your choice: "$RESET)" choice
        case $choice in
        1)
            echo -e "\e[32m* Installing dependencies..\e[0m"
            sudo apt update >/dev/null 2>&1

            # Install Curl
            if ! [ -x "$(command -v curl)" ]; then
                echo -e "\e[32m* Installing curl.\e[0m"
                sudo apt install -y curl >/dev/null 2>&1
            fi

            # Install NodeJS
            if ! [ -x "$(command -v node)" ]; then
                echo -e "\e[32m* Installing NodeJS\e[0m"
                curl -sL https://deb.nodesource.com/setup_18.x | sudo -E bash - >/dev/null 2>&1 && sudo apt install -y nodejs >/dev/null 2>&1
            fi

            # Install Git
            if ! [ -x "$(command -v git)" ]; then
                echo -e "\e[32m* Installing git.\e[0m"
                sudo apt install -y git >/dev/null 2>&1
            fi

            # Install Pm2
            if ! [ -x "$(command -v pm2)" ]; then
                echo -e "\e[32m* Installing pm2.\e[0m"
                sudo npm install pm2 -g >/dev/null 2>&1
            fi

            # Install Project Equinox app
            echo -e "\e[32m* Starting Installation\e[0m"
            # Prompt user for the directory to install the bot
            echo -e "\e[32m* Please enter the directory where you want to install the bot\e[0m"
            read -p "\e[32m* Directory path:\e[0m" install_dir

            # Check if the directory exists
            if [ ! -d "$install_dir" ]; then
                echo "\e[32m* Directory doesn't exist or is invalid. Exiting.\e[0m"
                exit 1
            fi

            # Change to the specified directory
            echo -e "\e[32m* Switching to the specified directory: $install_dir\e[0m"
            cd "$install_dir" || exit 1
            rm -r -f Project-Phoenix
            git clone https://github.com/soundphoenix428/Project-Phoenix >/dev/null 2>&1
            cd $install_dir/Project-Phoenix
            npm install >/dev/null 2>&1
            echo -e "\e[32m* Installation Completed\e[0m"

            # Start Project Equinox
            cd "$install_dir/Project-Phoenix/config" || exit
            # Prompt the user for values
            read -p "Enter developer ID: " dev_id
            read -p "Enter bot ID: " bot_id
            read -p "Enter bot token: " bot_token
            # Remove the old example files if they exist
            sudo rm -f config.example.json
            sudo rm -f debug.example.json
            sudo rm -f bot-sites.example.json

            # Overwrite config.json
            sudo sh -c "cat > config.json << 'EOF'
{
    \"developers\": [\"${dev_id}\"],
    \"client\": {
        \"id\": \"${bot_id}\",
        \"token\": \"${bot_token}\",
        \"intents\": [
            \"Guilds\",
            \"GuildMessages\",
            \"GuildMessageReactions\",
            \"DirectMessages\",
            \"DirectMessageReactions\"
        ],
        \"partials\": [\"Message\", \"Channel\", \"Reaction\"],
        \"caches\": {
            \"BaseGuildEmojiManager\": 0,
            \"GuildBanManager\": 0,
            \"GuildInviteManager\": 0,
            \"GuildStickerManager\": 0,
            \"MessageManager\": 0,
            \"PresenceManager\": 0,
            \"StageInstanceManager\": 0,
            \"ThreadManager\": 0,
            \"ThreadMemberManager\": 0,
            \"VoiceStateManager\": 0
        }
    },
    \"api\": {
        \"port\": 3001,
        \"secret\": \"00000000-0000-0000-0000-000000000000\"
    },
    \"sharding\": {
        \"spawnDelay\": 5,
        \"spawnTimeout\": 300,
        \"serversPerShard\": 1000
    },
    \"clustering\": {
        \"enabled\": false,
        \"shardCount\": 16,
        \"callbackUrl\": \"http://localhost:3001/\",
        \"masterApi\": {
            \"url\": \"http://localhost:5000/\",
            \"token\": \"00000000-0000-0000-0000-000000000000\"
        }
    },
    \"jobs\": {
        \"updateServerCount\": {
            \"schedule\": \"*/10 * * * *\",
            \"log\": true
        }
    },
    \"rateLimiting\": {
        \"commands\": {
            \"amount\": 10,
            \"interval\": 30
        },
        \"buttons\": {
            \"amount\": 10,
            \"interval\": 30
        },
        \"triggers\": {
            \"amount\": 10,
            \"interval\": 30
        },
        \"reactions\": {
            \"amount\": 10,
            \"interval\": 30
        }
    },
    \"logging\": {
        \"pretty\": true,
        \"rateLimit\": {
            \"minTimeout\": 30
        }
    }
}
EOF"

            # Overwrite debug.json
            sudo sh -c 'cat > debug.json <<EOF
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
EOF'

            sudo sh -c 'cat > bot-sites.json <<EOF
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
EOF'

            sudo pm2 start "npm run start:manager" --name "Project-Phoenix"
            sudo pm2 startup
            sudo pm2 save
            ;;
        2)
            sudo pm2 start "npm run start:manager" --name "Project-Phoenix"
            ;;
        3)
            sudo pm2 restart "npm restart" --name "Project-Phoenix"
            ;;
        4)
            sudo pm2 stop --name "Project-Phoenix"
            ;;
        5)
            echo -e "\e[32m* Exiting Bare Linux Options Menu\e[0m"
            exit
            ;;
        *) echo -e "\e[32m* Invalid option. Please choose a valid option.\e[0m" ;;
        esac
    done
}

# This script was made by Josh Severo (https://joshsevero.dev)
# Function for Docker Container options
docker_container_options() {
    while true; do
        RESET="\e[0m"
        GREEN="\e[32m"
        read -p "$(echo -e $GREEN"\n* Docker Container Options:\n1. Install/Update\n2. Start\n3. Restart\n4. Stop\n5. Exit\nEnter your choice: "$RESET)" choice
        case $choice in
        1)
            echo -e "\e[32m* You chose to Install/Update\e[0m" # Add your Install/Update logic here
            ;;
        2)
            echo -e "\e[32m* You chose to Start\e[0m" # Add your Start logic here
            ;;
        3)
            echo -e "\e[32m* You chose to Restart\e[0m" # Add your Restart logic here
            ;;
        4)
            echo -e "\e[32m* You chose to Stop\e[0m" # Add your Stop logic here
            ;;
        5)
            echo -e "\e[32m* Exiting Docker Container Options Menu\e[0m"
            exit
            ;;
        *) echo -e "\e[32m* Invalid option. Please choose a valid option.\e[0m" ;;
        esac
    done
}

# Main menu
while true; do
    RESET="\e[0m"
    GREEN="\e[32m"
    read -p "$(echo -e $GREEN"\n* Main Menu:\n1. Bare Linux\n2. Docker Container\n3. Exit\nEnter your choice: "$RESET)" option
    case $option in
    1)
        echo -e "\e[32m* You chose Bare Linux\e[0m"
        bare_linux_options
        ;;
    2)
        echo -e "\e[32m* You chose Docker Container\e[0m"
        docker_container_options
        ;;
    3)
        echo -e "\e[32m* Exiting the Installation Script\e[0m"
        exit
        ;;
    *) echo -e "\e[32m* Invalid option. Please choose a valid option.\e[0m" ;;
    esac
    # This script was made by Josh Severo (me@joshsevero.dev)
done 