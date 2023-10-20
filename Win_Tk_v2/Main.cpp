#include <iostream>
#include <cstdlib>
#include <windows.h>
#include <thread>

// Function to execute a PowerShell command
int executePowerShellCommand(const std::string& command) {
    std::string fullCommand = "powershell.exe -Command \"" + command + "\"";

    int result = system(fullCommand.c_str());

    if (result == 0) {
        std::cout << "PowerShell command executed successfully." << std::endl;
    }
    else {
        std::cout << "Error executing PowerShell command. Exit code: " << result << std::endl;
    }

    return result;
}

// Function to check if the program is running with administrative privileges
bool isRunningAsAdministrator() {
    HANDLE hToken;
    BOOL bIsAdmin = FALSE;

    if (OpenProcessToken(GetCurrentProcess(), TOKEN_QUERY, &hToken)) {
        TOKEN_ELEVATION Elevation = { 0 }; // Initialize the Elevation variable
        DWORD cbSize = sizeof(TOKEN_ELEVATION);

        if (GetTokenInformation(hToken, TokenElevation, &Elevation, cbSize, &cbSize)) {
            bIsAdmin = Elevation.TokenIsElevated;
        }

        CloseHandle(hToken);
    }

    return bIsAdmin;
}

// Function to wait for a specified duration and then exit
void waitForExit(int minutes) {
    std::this_thread::sleep_for(std::chrono::minutes(minutes));
}

// Function to apply registry changes
void applyRegistryChanges() {
    // Disable storing SMB passwords in plaintext
    executePowerShellCommand("Set-ItemProperty -Path 'HKLM:\\SYSTEM\\CurrentControlSet\\services\\LanmanWorkstation\\Parameters' -Name 'EnablePlainTextPassword' -Value 0");

    // Clear remotely accessible registry paths
    executePowerShellCommand("Remove-ItemProperty -Path 'HKLM:\\SYSTEM\\CurrentControlSet\\Control\\SecurePipeServers\\winreg\\AllowedExactPaths' -Name 'Machine'");

    // Clear remotely accessible registry paths and sub-paths
    executePowerShellCommand("Remove-ItemProperty -Path 'HKLM:\\SYSTEM\\CurrentControlSet\\Control\\SecurePipeServers\\winreg\\AllowedPaths' -Name 'Machine'");

    // Restrict anonymous access to named pipes and shares
    executePowerShellCommand("Set-ItemProperty -Path 'HKLM:\\SYSTEM\\CurrentControlSet\\services\\LanmanServer\\Parameters' -Name 'NullSessionShares' -Value ''");

    // Restrict CD ROM drive
    executePowerShellCommand("Set-ItemProperty -Path 'HKLM:\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Winlogon' -Name 'AllocateCDRoms' -Value 1");

    // Disallow remote access to floppy disks
    executePowerShellCommand("Set-ItemProperty -Path 'HKLM:\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Winlogon' -Name 'AllocateFloppies' -Value 1");

    // Prevent print driver installs
    executePowerShellCommand("Set-ItemProperty -Path 'HKLM:\\SYSTEM\\CurrentControlSet\\Control\\Print\\Providers\\LanMan Print Services\\Servers' -Name 'AddPrinterDrivers' -Value 1");

    // Limit local account use of blank passwords to console
    executePowerShellCommand("Set-ItemProperty -Path 'HKLM:\\SYSTEM\\CurrentControlSet\\Control\\Lsa' -Name 'LimitBlankPasswordUse' -Value 1");

    // Set maximum machine password age
    executePowerShellCommand("Set-ItemProperty -Path 'HKLM:\\SYSTEM\\CurrentControlSet\\services\\Netlogon\\Parameters' -Name 'MaximumPasswordAge' -Value 15");

    // Disable security signature requirement
    executePowerShellCommand("Set-ItemProperty -Path 'HKLM:\\SYSTEM\\CurrentControlSet\\services\\LanmanServer\\Parameters' -Name 'enablesecuritysignature' -Value 0");

    // Disable security signature enforcement
    executePowerShellCommand("Set-ItemProperty -Path 'HKLM:\\SYSTEM\\CurrentControlSet\\services\\LanmanServer\\Parameters' -Name 'requiresecuritysignature' -Value 0");
}

int main() {
    if (!isRunningAsAdministrator()) {
        std::cout << "Please run the program as an administrator." << std::endl;
        waitForExit(3);
        return 1;
    }

    int choice;

    while (true) {
        // Display the menu
        std::cout << "Win_Tk_Menu:" << std::endl;
        std::cout << "1. Activate System Firewall" << std::endl;
        std::cout << "2. Enforce Password Settings" << std::endl;
        std::cout << "3. Disable Unsecure Settings/Features" << std::endl;
        std::cout << "4. Disable Guest Account" << std::endl;
        std::cout << "5. Set Windows Update to Automatically" << std::endl;
        std::cout << "6. Exit" << std::endl;
        std::cout << "Enter your choice (1-6): ";

        // Get the user's choice
        std::cin >> choice;

        // Process the choice
        switch (choice) {
        case 1:
            std::cout << "Activating System Firewall..." << std::endl;
            executePowerShellCommand("Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True");
            break;
        case 2:
            std::cout << "Enforcing Password Settings..." << std::endl;
            // Set minimum password length to 10 characters
            executePowerShellCommand("Set-LocalUserPasswordPolicy -PasswordHistoryCount 5 -MinimumPasswordLength 10");

            // Set maximum password age to 30 days
            executePowerShellCommand("Set-LocalUserPasswordPolicy -PasswordHistoryCount 5 -MaximumPasswordAge 30");

            // Set minimum password age to 5 days
            executePowerShellCommand("Set-LocalUserPasswordPolicy -PasswordHistoryCount 5 -MinimumPasswordAge 5");
            break;
        case 3:
            std::cout << "Disabling Unsecure Settings/Features..." << std::endl;
            applyRegistryChanges(); // Apply registry changes
            break;
        case 4:
            std::cout << "Disabling Guest Account..." << std::endl;
            executePowerShellCommand("net user guest /active:no");
            break;
        case 5:
            std::cout << "Setting Windows Update to Automatically..." << std::endl;
            executePowerShellCommand("reg add \"HKLM\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\WindowsUpdate\\Auto Update\" /v AUOptions /t REG_DWORD /d 3 /f");
            break;
        case 6:
            std::cout << "Exiting the program. Goodbye!" << std::endl;
            return 0;
        default:
            std::cout << "Invalid choice. Please enter a number between 1 and 6." << std::endl;
        }
    }

    return 0;
}

