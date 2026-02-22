Param(
    [switch]$DoPush,
    [string]$GitRemote = "git@github.com:paruladlakha123/LearningPlaywright.git",
    [string]$KeyPath = "$env:USERPROFILE\.ssh\id_ed25519"
)

Write-Host "SSH setup script starting..."

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Error "Git is not installed or not in PATH. Install Git for Windows and re-run this script."
    exit 1
}

$sshDir = Split-Path $KeyPath
if (-not (Test-Path $sshDir)) { New-Item -ItemType Directory -Path $sshDir -Force | Out-Null }

if (Test-Path $KeyPath) {
    $answer = Read-Host "SSH key $KeyPath already exists. Overwrite? (y/N)"
    if ($answer -eq 'y') {
        Remove-Item $KeyPath, "$KeyPath.pub" -ErrorAction SilentlyContinue
    } else {
        Write-Host "Keeping existing key: $KeyPath"
    }
}

if (-not (Test-Path $KeyPath)) {
    $email = Read-Host "Enter email for SSH key comment (e.g. your_email@example.com)"
    ssh-keygen -t ed25519 -C $email -f $KeyPath -N "" | Out-Null
    Write-Host "Generated SSH key at $KeyPath"
}

try {
    Start-Service ssh-agent -ErrorAction Stop
} catch {
    Write-Host "Could not start ssh-agent service automatically. You may need to run PowerShell as Administrator or start the service manually: Start-Service ssh-agent"
}

ssh-add $KeyPath | Out-Null

$pubKeyPath = "$KeyPath.pub"
if (Test-Path $pubKeyPath) {
    $pub = Get-Content $pubKeyPath -Raw
    try { $pub | Set-Clipboard } catch { Write-Host "Failed to copy to clipboard; you can copy manually from: $pubKeyPath" }
    Write-Host "Public key copied to clipboard (or available at $pubKeyPath). Paste it into GitHub → Settings → SSH and GPG keys."
    Write-Host "\n--- Begin public key ---\n"
    Write-Host $pub
    Write-Host "\n--- End public key ---\n"
} else {
    Write-Error "Public key not found at $pubKeyPath"
}

# Configure SSH remote
& git remote remove origin 2>$null
& git remote add origin $GitRemote
Write-Host "Set 'origin' to $GitRemote"

if ($DoPush) {
    if (-not (Test-Path ".git")) { git init }
    git add .
    try { git commit -m "Initial repo setup" } catch { }
    git branch -M main
    Write-Host "Attempting to push to origin main. Ensure the public SSH key is added to your GitHub account first."
    git push -u origin main
}

Write-Host "SSH setup script completed."
