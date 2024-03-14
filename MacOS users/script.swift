#!/usr/bin/swift

import Foundation

// Display script header
print("""
    # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
    #           Project Phoenix Installation Script         #
    #       This Script only works on Macintosh Systems     #
    # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
    """)

// Function for Bare Linux options
func bareLinuxOptions() {
    while true {
        let reset = "\u{001B}[0m"
        let green = "\u{001B}[32m"
        print("\(green)\n* Bare Linux Options:\n1. Install/Update\n2. Start\n3. Restart\n4. Stop\n5. Exit\nEnter your choice: \(reset)", terminator: "")
        if let choice = readLine() {
            switch choice {
            case "1":
                print("* Installing dependencies..")
                // Add your installation logic here
            case "2":
                print("* Starting the application..")
                // Add your start logic here
            case "3":
                print("* Restarting the application..")
                // Add your restart logic here
            case "4":
                print("* Stopping the application..")
                // Add your stop logic here
            case "5":
                print("* Exiting Bare Linux Options Menu")
                exit(0)
            default:
                print("* Invalid option. Please choose a valid option.")
            }
        }
    }
}
// This script was made by Tanner Schermerhorn (me@tannerschermerhorn.dev) and Josh Severo (me@joshsevero.dev)
// Function for Docker Container options
func dockerContainerOptions() {
    while true {
        let reset = "\u{001B}[0m"
        let green = "\u{001B}[32m"
        print("\(green)\n* Docker Container Options:\n1. Install/Update\n2. Start\n3. Restart\n4. Stop\n5. Exit\nEnter your choice: \(reset)", terminator: "")
        if let choice = readLine() {
            switch choice {
            case "1":
                print("* You chose to Install/Update")
                // Add your install/update logic here
            case "2":
                print("* You chose to Start")
                // Add your start logic here
            case "3":
                print("* You chose to Restart")
                // Add your restart logic here
            case "4":
                print("* You chose to Stop")
                // Add your stop logic here
            case "5":
                print("* Exiting Docker Container Options Menu")
                exit(0)
            default:
                print("* Invalid option. Please choose a valid option.")
            }
        }
    }
}

// Main menu
while true {
    let reset = "\u{001B}[0m"
    let green = "\u{001B}[32m"
    print("\(green)\n* Main Menu:\n1. Bare Linux\n2. Docker Container\n3. Exit\nEnter your choice: \(reset)", terminator: "")
    if let option = readLine() {
        switch option {
        case "1":
            print("* You chose Bare Linux")
            bareLinuxOptions()
        case "2":
            print("* You chose Docker Container")
            dockerContainerOptions()
        case "3":
            print("* Exiting the Installation Script")
            exit(0)
        default:
            print("* Invalid option. Please choose a valid option.")
        }
    }
}
// This script was made by Tanner Schermerhorn (https://tannerschermerhorn.dev) and Josh Severo (https://joshsevero.dev)