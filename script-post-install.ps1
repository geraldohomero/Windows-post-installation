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
## Choco
choco install vscode; sql-server-express

## Winget  install
winget install Microsoft.VisualStudio.2022.Community; winget install 7zip.7zip; winget install Git.Git; winget install GitHub.GitHubDesktop; winget install Brave.Brave; winget install KDE.Okular; winget install LibreWolf.LibreWolf

# Create folder Github
$desktopPath = [Environment]::GetFolderPath("Desktop")
$folderName = "Github"
$folderPath = Join-Path $desktopPath $folderName

# Verification
if (!(Test-Path $folderPath)) {
    # Create
    New-Item -ItemType Directory -Path $folderPath | Out-Null
    Write-Host "A pasta '$folderName' foi criada com sucesso na área de trabalho."
}
else {
    Write-Host "A pasta '$folderName' já existe na área de trabalho."
}


Write-Host "Pressione qualquer tecla para fechar..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
