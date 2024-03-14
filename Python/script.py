import subprocess

def main_menu():
    print("\033[32m\n# # # # # # # # # # # # # # # # # # # # # # # # # # # # #")
    print("#           Project Phoenix Installation Script         #")
    print("#           This Script only works with Python          #")
    print("# # # # # # # # # # # # # # # # # # # # # # # # # # # # #\033[0m")

    while True:
        try:
            option = int(input("\033[32m\n* Main Menu:\n1. Bare Linux\n2. Docker Container\n3. Exit\nEnter your choice: \033[0m"))
            if option == 1:
                bare_linux_options()
            elif option == 2:
                docker_container_options()
            elif option == 3:
                print("\033[32m* Exiting the Installation Script\033[0m")
                break
            else:
                print("\033[32m* Invalid option. Please choose a valid option.\033[0m")
        except ValueError:
            print("\033[32m* Invalid option. Please choose a valid option.\033[0m")
# This script was made by Tanner Schermerhorn (me@tannerschermerhorn.dev) and Josh Severo (me@joshsevero.dev)
def bare_linux_options():
    while True:
        try:
            choice = int(input("\033[32m\n* Bare Linux Options:\n1. Install/Update\n2. Start\n3. Restart\n4. Stop\n5. Exit\nEnter your choice: \033[0m"))
            if choice == 1:
                install_dependencies()
            elif choice == 2:
                subprocess.run(["sudo", "pm2", "start", "npm run start:manager", "--name", "Project-Phoenix"], check=True)
            elif choice == 3:
                subprocess.run(["sudo", "pm2", "restart", "npm restart", "--name", "Project-Phoenix"], check=True)
            elif choice == 4:
                subprocess.run(["sudo", "pm2", "stop", "--name", "Project-Phoenix"], check=True)
            elif choice == 5:
                print("\033[32m* Exiting Bare Linux Options Menu\033[0m")
                break
            else:
                print("\033[32m* Invalid option. Please choose a valid option.\033[0m")
        except ValueError:
            print("\033[32m* Invalid option. Please choose a valid option.\033[0m")

def install_dependencies():
    print("\033[32m* Installing dependencies..\033[0m")
    subprocess.run(["sudo", "apt", "update"], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    # Install Curl
    if subprocess.run(["command", "-v", "curl"], stdout=subprocess.PIPE).returncode != 0:
        print("\033[32m* Installing curl.\033[0m")
        subprocess.run(["sudo", "apt", "install", "-y", "curl"], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    # Install NodeJS
    if subprocess.run(["command", "-v", "node"], stdout=subprocess.PIPE).returncode != 0:
        print("\033[32m* Installing NodeJS\033[0m")
        subprocess.run(["curl", "-sL", "https://deb.nodesource.com/setup_18.x", "|", "sudo", "-E", "bash", "-"], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
        subprocess.run(["sudo", "apt", "install", "-y", "nodejs"], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    # Install Git
    if subprocess.run(["command", "-v", "git"], stdout=subprocess.PIPE).returncode != 0:
        print("\033[32m* Installing git.\033[0m")
        subprocess.run(["sudo", "apt", "install", "-y", "git"], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    # Install Pm2
    if subprocess.run(["command", "-v", "pm2"], stdout=subprocess.PIPE).returncode != 0:
        print("\033[32m* Installing pm2.\033[0m")
        subprocess.run(["sudo", "npm", "install", "pm2", "-g"], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    # Install Project Phoenix App (code omitted for brevity)

def docker_container_options():
    # Similar logic as bare_linux_options(), just print statements as placeholders.
    pass

if __name__ == "__main__":
    main_menu()
# This script was made by Tanner Schermerhorn (https://tannerschermerhorn.dev) and Josh Severo (https://joshsevero.dev)