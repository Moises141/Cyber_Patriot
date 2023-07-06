using System;
using Microsoft.Win32;
using System.Diagnostics;
using System.IO;
using System.Net;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;
using Microsoft.VisualBasic.ApplicationServices;
using System.Security.Principal;

namespace Win_Toolbox
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            DialogResult result = MessageBox.Show("Warning: Some settings on Windows security will be changed.\n\nFor more information, check the GitHub repository.", "Warning", MessageBoxButtons.OKCancel, MessageBoxIcon.Warning);

            if (result == DialogResult.OK)
            {
                // Disable Terminal Services connections
                ExecuteCommand("cmd", "/c reg add \"HKLM\\SYSTEM\\CurrentControlSet\\Control\\Terminal Server\" /v fDenyTSConnections /t REG_DWORD /d 1 /f");

                // Disable user authentication for RDP-Tcp connections
                ExecuteCommand("cmd", "/c reg add \"HKLM\\SYSTEM\\CurrentControlSet\\Control\\Terminal Server\\WinStations\\RDP-Tcp\" /v UserAuthentication /t REG_DWORD /d 0 /f");

                // Set minimum password length to 10 characters
                ExecuteCommand("cmd", "/c net accounts /minpwlen:10");

                // Set maximum password age to 30 days
                ExecuteCommand("cmd", "/c net accounts /maxpwage:30");

                // Set minimum password age to 5 days
                ExecuteCommand("cmd", "/c net accounts /minpwage:5");

                // Display account policies
                ExecuteCommand("cmd", "/c net accounts");

                // Enable Windows Firewall for all profiles (Domain, Public, Private)
                ExecuteCommand("powershell", "-Command \"Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True\"");

                // Set Windows Update to automatically download and notify for installation
                ExecuteCommand("cmd", "/c reg add \"HKLM\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\WindowsUpdate\\Auto Update\" /v AUOptions /t REG_DWORD /d 3 /f");

                //Set Disable Guest Account
                ExecuteCommand("cmd", "/ c net user guest / active:no");

                // Apply additional Windows security settings
                ApplyAdditionalSecuritySettings();

                // Disable IIS-related features
                DisableIISFeatures();
            }
        }


        private void ApplyAdditionalSecuritySettings()
        //Disabled weak services...
        {
            // Disable storing SMB passwords in plaintext
            Registry.SetValue(@"HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\LanmanWorkstation\Parameters",
                "EnablePlainTextPassword", 0, RegistryValueKind.DWord);

            // Clear remotely accessible registry paths
            Registry.SetValue(@"HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurePipeServers\winreg\AllowedExactPaths",
                "Machine", "", RegistryValueKind.MultiString);

            // Clear remotely accessible registry paths and sub-paths
            Registry.SetValue(@"HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurePipeServers\winreg\AllowedPaths",
                "Machine", "", RegistryValueKind.MultiString);

            // Restrict anonymous access to named pipes and shares
            Registry.SetValue(@"HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters",
                "NullSessionShares", "", RegistryValueKind.MultiString);

            // Restrict CD ROM drive
            Registry.SetValue(@"HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon",
                "AllocateCDRoms", 1, RegistryValueKind.DWord);

            // Disallow remote access to floppy disks
            Registry.SetValue(@"HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon",
                "AllocateFloppies", 1, RegistryValueKind.DWord);

            // Prevent print driver installs
            Registry.SetValue(@"HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print\Providers\LanMan Print Services\Servers",
                "AddPrinterDrivers", 1, RegistryValueKind.DWord);

            // Limit local account use of blank passwords to console
            Registry.SetValue(@"HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa",
                "LimitBlankPasswordUse", 1, RegistryValueKind.DWord);

            // Set maximum machine password age
            Registry.SetValue(@"HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\Netlogon\Parameters",
                "MaximumPasswordAge", 15, RegistryValueKind.DWord);

            // Disable security signature requirement
            Registry.SetValue(@"HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters",
                "enablesecuritysignature", 0, RegistryValueKind.DWord);

            // Disable security signature enforcement
            Registry.SetValue(@"HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters",
                "requiresecuritysignature", 0, RegistryValueKind.DWord);
        }

        private void DisableIISFeatures()
        {
            ExecuteCommand("dism", "/online /disable-feature /featurename:IIS-WebServerRole");
            ExecuteCommand("dism", "/online /disable-feature /featurename:IIS-WebServer");
            ExecuteCommand("dism", "/online /disable-feature /featurename:IIS-CommonHttpFeatures");
            ExecuteCommand("dism", "/online /disable-feature /featurename:IIS-HttpErrors");
            ExecuteCommand("dism", "/online /disable-feature /featurename:IIS-HttpRedirect");
            ExecuteCommand("dism", "/online /disable-feature /featurename:IIS-ApplicationDevelopment");
            ExecuteCommand("dism", "/online /disable-feature /featurename:IIS-NetFxExtensibility");
            ExecuteCommand("dism", "/online /disable-feature /featurename:IIS-NetFxExtensibility45");
            ExecuteCommand("dism", "/online /disable-feature /featurename:IIS-HealthAndDiagnostics");
            ExecuteCommand("dism", "/online /disable-feature /featurename:IIS-HttpLogging");
            ExecuteCommand("dism", "/online /disable-feature /featurename:IIS-LoggingLibraries");
            ExecuteCommand("dism", "/online /disable-feature /featurename:IIS-RequestMonitor");
            ExecuteCommand("dism", "/online /disable-feature /featurename:IIS-HttpTracing");
            ExecuteCommand("dism", "/online /disable-feature /featurename:IIS-Security");
            ExecuteCommand("dism", "/online /disable-feature /featurename:IIS-URLAuthorization");
            ExecuteCommand("dism", "/online /disable-feature /featurename:IIS-RequestFiltering");
            ExecuteCommand("dism", "/online /disable-feature /featurename:IIS-IPSecurity");
            ExecuteCommand("dism", "/online /disable-feature /featurename:IIS-Performance");
            ExecuteCommand("dism", "/online /disable-feature /featurename:IIS-HttpCompressionDynamic");
            ExecuteCommand("dism", "/online /disable-feature /featurename:IIS-WebServerManagementTools");
            ExecuteCommand("dism", "/online /disable-feature /featurename:IIS-ManagementScriptingTools");
            ExecuteCommand("dism", "/online /disable-feature /featurename:IIS-IIS6ManagementCompatibility");
            ExecuteCommand("dism", "/online /disable-feature /featurename:IIS-Metabase");
            ExecuteCommand("dism", "/online /disable-feature /featurename:IIS-HostableWebCore");
            ExecuteCommand("dism", "/online /disable-feature /featurename:IIS-StaticContent");
            ExecuteCommand("dism", "/online /disable-feature /featurename:IIS-DefaultDocument");
            ExecuteCommand("dism", "/online /disable-feature /featurename:IIS-DirectoryBrowsing");
            ExecuteCommand("dism", "/online /disable-feature /featurename:IIS-WebDAV");
            ExecuteCommand("dism", "/online /disable-feature /featurename:IIS-WebSockets");
            ExecuteCommand("dism", "/online /disable-feature /featurename:IIS-ApplicationInit");
            ExecuteCommand("dism", "/online /disable-feature /featurename:IIS-ASPNET");
            ExecuteCommand("dism", "/online /disable-feature /featurename:IIS-ASPNET45");
            ExecuteCommand("dism", "/online /disable-feature /featurename:IIS-ASP");
            ExecuteCommand("dism", "/online /disable-feature /featurename:IIS-CGI");
            ExecuteCommand("dism", "/online /disable-feature /featurename:IIS-ISAPIExtensions");
            ExecuteCommand("dism", "/online /disable-feature /featurename:IIS-ISAPIFilter");
            ExecuteCommand("dism", "/online /disable-feature /featurename:IIS-ServerSideIncludes");
            ExecuteCommand("dism", "/online /disable-feature /featurename:IIS-CustomLogging");
            ExecuteCommand("dism", "/online /disable-feature /featurename:IIS-BasicAuthentication");
            ExecuteCommand("dism", "/online /disable-feature /featurename:IIS-HttpCompressionStatic");
            ExecuteCommand("dism", "/online /disable-feature /featurename:IIS-ManagementConsole");
            ExecuteCommand("dism", "/online /disable-feature /featurename:IIS-ManagementService");
            ExecuteCommand("dism", "/online /disable-feature /featurename:IIS-WMICompatibility");
            ExecuteCommand("dism", "/online /disable-feature /featurename:IIS-LegacyScripts");
            ExecuteCommand("dism", "/online /disable-feature /featurename:IIS-LegacySnapIn");
            ExecuteCommand("dism", "/online /disable-feature /featurename:IIS-FTPServer");
            ExecuteCommand("dism", "/online /disable-feature /featurename:IIS-FTPSvc");
            ExecuteCommand("dism", "/online /disable-feature /featurename:IIS-FTPExtensibility");
            ExecuteCommand("dism", "/online /disable-feature /featurename:TFTP");
            ExecuteCommand("dism", "/online /disable-feature /featurename:TelnetClient");
            ExecuteCommand("dism", "/online /disable-feature /featurename:TelnetServer");
        }

        private void ExecuteCommand(string command, string arguments)
        {
            ProcessStartInfo processInfo = new ProcessStartInfo
            {
                FileName = command,
                Arguments = arguments,
                RedirectStandardOutput = true,
                RedirectStandardError = true,
                CreateNoWindow = true,
                UseShellExecute = false
            };

            using (Process process = new Process())
            {
                process.StartInfo = processInfo;
                process.Start();
                process.WaitForExit();

                string output = process.StandardOutput.ReadToEnd();
                string error = process.StandardError.ReadToEnd();

                // Handle the output and error messages if needed
                // For example, display them in a MessageBox
                if (!string.IsNullOrEmpty(output))
                    MessageBox.Show(output);

                if (!string.IsNullOrEmpty(error))
                    MessageBox.Show(error);
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Process.Start("cmd", "/c start taskmgr && exit");
        }

        private void button3_Click(object sender, EventArgs e)
        {
            // Execute SFC command with administrator privileges
            ProcessStartInfo psi = new ProcessStartInfo("cmd.exe", "/k sfc.exe /scannow");
            psi.Verb = "runas"; // Prompts for administrator privileges
            Process.Start(psi);
        }

        private void button4_Click(object sender, EventArgs e)
        {
            // PowerShell command to download the file
            string powerShellCommand = @"powershell.exe -Command ""Invoke-WebRequest -OutFile MBRTKit.exe https://data-cdn.mbamupdates.com/web/mbar-1.10.3.1001.exe""";

            // Create a process to execute the PowerShell command
            Process process = new Process();
            ProcessStartInfo startInfo = new ProcessStartInfo();
            startInfo.FileName = "cmd.exe";
            startInfo.Arguments = "/c " + powerShellCommand + " && start MBRTKit.exe";
            process.StartInfo = startInfo;

            // Start the process
            process.Start();
        }

        private void button7_Click(object sender, EventArgs e)
        {
            // Create a new ProcessStartInfo instance with the command and arguments
            ProcessStartInfo psi = new ProcessStartInfo("cmd", "/c ncpa.cpl");

            // Set the UseShellExecute property to true to run the command within the shell
            psi.UseShellExecute = true;

            // Set the CreateNoWindow property to true to hide the Command Prompt window
            psi.CreateNoWindow = true;

            // Start the process using the ProcessStartInfo
            Process.Start(psi)?.WaitForExit();
        }

        private void button8_Click(object sender, EventArgs e)
        {
            // Create a new ProcessStartInfo instance with the command and arguments
            ProcessStartInfo psi = new ProcessStartInfo("cmd", "/c appwiz.cpl");

            // Set the UseShellExecute property to true to run the command within the shell
            psi.UseShellExecute = true;

            // Set the CreateNoWindow property to true to hide the Command Prompt window
            psi.CreateNoWindow = true;

            // Start the process using the ProcessStartInfo
            Process.Start(psi)?.WaitForExit();
        }

        private void button9_Click(object sender, EventArgs e)
        {
            string? drive = Path.GetPathRoot(Environment.SystemDirectory);
            if (drive != null)
            {
                string folderPath = Path.Combine(drive, "UsersListFolder");
                Directory.CreateDirectory(folderPath);
                string filePath = Path.Combine(folderPath, "Users_list.txt");

                if (!File.Exists(filePath))
                {
                    Process.Start("cmd", $"/c net users > \"{filePath}\"");
                }
                else
                {
                    MessageBox.Show("The file already exists.");
                }

                // Display notification about the storage location
                string notificationMessage = $"User information is stored in:\n\n{folderPath}";
                MessageBox.Show(notificationMessage, "Storage Location", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                MessageBox.Show("Drive could not be determined.");
            }
        }

        private void button5_Click(object sender, EventArgs e)
        {
            string url = "https://www.virustotal.com/gui/home/upload";
            ProcessStartInfo psi = new ProcessStartInfo
            {
                FileName = url,
                UseShellExecute = true
            };
            Process.Start(psi);
        }

        private void button6_Click(object sender, EventArgs e)
        {
            string url = "https://sites.google.com/view/cyber-archive/home?authuser=0";
            ProcessStartInfo psi = new ProcessStartInfo
            {
                FileName = url,
                UseShellExecute = true
            };
            Process.Start(psi);

        }

        private void Form1_Load(object sender, EventArgs e)
        {
            // Check if winget is already installed
            bool wingetInstalled = CheckIfWingetInstalled();

            if (!wingetInstalled)
            {
                // PowerShell command to download the file
                string powerShellCommand = @"powershell.exe -Command ""Invoke-WebRequest -OutFile winget_installer.msixbundle https://aka.ms/getwinget""";

                // Create a process to execute the PowerShell command
                Process process = new Process();
                ProcessStartInfo startInfo = new ProcessStartInfo();
                startInfo.FileName = "cmd.exe";
                startInfo.Arguments = "/c " + powerShellCommand + " && start winget_installer.msixbundle";
                process.StartInfo = startInfo;

                // Start the process
                process.Start();
            }
            else
            {
                MessageBox.Show("Windows Package Manager (winget) is already installed.");
            }
        }

        private bool CheckIfWingetInstalled()
        {
            // PowerShell command to check if winget is installed
            string powerShellCommand = @"powershell.exe -Command ""Get-Command -Name winget -ErrorAction SilentlyContinue""";

            // Create a process to execute the PowerShell command
            Process process = new Process();
            ProcessStartInfo startInfo = new ProcessStartInfo();
            startInfo.FileName = "cmd.exe";
            startInfo.Arguments = "/c " + powerShellCommand;
            startInfo.RedirectStandardOutput = true;
            startInfo.UseShellExecute = false;
            startInfo.CreateNoWindow = true;
            process.StartInfo = startInfo;

            // Start the process and read the output
            process.Start();
            string output = process.StandardOutput.ReadToEnd();
            process.WaitForExit();

            // Check if winget is found in the output
            return output.Contains("winget");
        }

        private void button10_Click(object sender, EventArgs e)
        {
            string? drive = Path.GetPathRoot(Environment.SystemDirectory);
            if (drive != null)
            {
                string folderPath = Path.Combine(drive, "Junk_Found");
                Directory.CreateDirectory(folderPath);
                string filePath = Path.Combine(folderPath, "Junk_Found.txt");

                if (!File.Exists(filePath))
                {
                    Process.Start("cmd", $"/c dir C:\\Users\\ /B /S /A:-D /O:N /S *.jpg *.png *.mp4 *.mp3 > \"{filePath}\"");
                }
                else
                {
                    MessageBox.Show("The file already exists.");
                }

                // Display notification about the storage location
                string notificationMessage = $"Junk found is stored in:\n\n{folderPath}";
                MessageBox.Show(notificationMessage, "Storage Location", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                MessageBox.Show("Drive could not be determined.");
            }
        }

        private void button11_Click(object sender, EventArgs e)
        {
            // Define the commands to add firewall rules
            string[] commands =
               {
         "netsh advfirewall firewall add rule name=\"Block appvlp.exe netconns\" program=\"C:\\Program Files (x86)\\Microsoft Office\\root\\client\\AppVLP.exe\" protocol=tcp dir=out enable=yes action=block profile=any",
         "netsh advfirewall firewall add rule name=\"Block appvlp.exe netconns\" program=\"C:\\Program Files\\Microsoft Office\\root\\client\\AppVLP.exe\" protocol=tcp dir=out enable=yes action=block profile=any",
         "netsh advfirewall firewall add rule name=\"Block calc.exe netconns\" program=\"%systemroot%\\system32\\calc.exe\" protocol=tcp dir=out enable=yes action=block profile=any",
         "netsh advfirewall firewall add rule name=\"Block calc.exe netconns\" program=\"%systemroot%\\SysWOW64\\calc.exe\" protocol=tcp dir=out enable=yes action=block profile=any"
           };

            // Execute each netsh command
            foreach (string command in commands)
            {
                ExecuteNetshCommand(command);
            }

            MessageBox.Show("Firewall rules added successfully!");
        }

        // Helper method to execute a netsh command
        private void ExecuteNetshCommand(string command)
        {
            ProcessStartInfo startInfo = new ProcessStartInfo
            {
                FileName = "netsh",
                Arguments = command,
                RedirectStandardOutput = true,
                UseShellExecute = false,
                CreateNoWindow = true
            };
            Process process = new Process
            {
                StartInfo = startInfo
            };
            process.Start();
            process.WaitForExit();
        }
    }
}