# Check if the execution policy allows script installation
$executionPolicy = Get-ExecutionPolicy
if ($executionPolicy -ne "RemoteSigned" -and $executionPolicy -ne "Unrestricted") {
    Write-Host "Changing execution policy..."
    Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
}

# Install Chocolatey
Write-Host "Installing Chocolatey..."
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Check if Chocolatey is installed
if (Get-Command choco -ErrorAction SilentlyContinue) {
    Write-Host "Chocolatey installation completed."
}
else {
    Write-Host "Chocolatey installation failed."
}

# Install programs

choco install vscode; sql-server-express


winget install Microsoft.VisualStudio.2022.Community; winget install 7zip.7zip; winget install Git.Git; winget install GitHub.GitHubDesktop; winget install Brave.Brave; winget install KDE.Okular; winget install LibreWolf.LibreWolf
choco install vscode; choco install sql-server-express
