Param(
    [string]$RemoteUrl = "https://github.com/paruladlakha123/LearningPlaywright.git",
    [string]$Username,
    [string]$PAT
)

Write-Host "Preparing to push repository via HTTPS (credential helper will be configured)."

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Error "Git is not installed or not in PATH. Install Git for Windows and re-run this script."
    exit 1
}

Write-Host "Configuring Git credential helper to 'manager-core'..."
git config --global credential.helper manager-core

if (-not (Test-Path ".git")) {
    Write-Host "No git repository found — initializing..."
    git init
}

Write-Host "Staging files..."
git add .

Write-Host "Committing changes (if any)..."
try {
    git commit -m "Initial repo setup" | Out-Null
} catch {
    Write-Host "No changes to commit or commit failed; continuing."
}

Write-Host "Setting branch to 'main' and remote to $RemoteUrl"
git branch -M main 2>$null
git remote remove origin 2>$null
git remote add origin $RemoteUrl

if ($Username -and $PAT) {
    Write-Host "Warning: using a PAT passed on the command line can be visible in process lists or shell history; avoid storing it." -ForegroundColor Yellow
    $authUrl = $RemoteUrl -replace '^https://', "https://$Username`:$PAT@"
    Write-Host "Performing one-time push using provided credentials..."
    try {
        git push $authUrl main -u
    } catch {
        Write-Host "Authenticated push failed. Check username/PAT and repository permissions."
    Param(
        [string]$RemoteUrl = "https://github.com/paruladlakha123/LearningPlaywright.git",
        [string]$Username,
        [string]$PAT
    )

    Write-Host "Preparing to push repository via HTTPS (credential helper will be configured)."

    if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
        Write-Error "Git is not installed or not in PATH. Install Git for Windows and re-run this script."
        exit 1
    }

    Write-Host "Configuring Git credential helper to 'manager-core'..."
    git config --global credential.helper manager-core

    if (-not (Test-Path ".git")) {
        Write-Host "No git repository found — initializing..."
        git init
    }

    Write-Host "Staging files..."
    git add .

    Write-Host "Committing changes (if any)..."
    try {
        git commit -m "Initial repo setup" | Out-Null
    } catch {
        Write-Host "No changes to commit or commit failed; continuing."
    }

    Write-Host "Setting branch to 'main' and remote to $RemoteUrl"
    git branch -M main 2>$null
    git remote remove origin 2>$null
    git remote add origin $RemoteUrl

    if ($Username -and $PAT) {
        Write-Host "Warning: using a PAT passed on the command line can be visible in process lists or shell history; avoid storing it." -ForegroundColor Yellow
        $authUrl = $RemoteUrl -replace '^https://', "https://$Username`:$PAT@"
        Write-Host "Performing one-time push using provided credentials..."
        try {
            git push $authUrl main -u
        } catch {
            Write-Host "Authenticated push failed. Check username/PAT and repository permissions."
        }
    } else {
        Write-Host "Attempting to push to origin/main. If prompted for credentials, enter your GitHub username and paste your Personal Access Token (PAT) as the password."
        try {
            git push -u origin main
        } catch {
            Write-Host "Push failed. Common reasons:"
            Write-Host " - You haven't added your PAT when prompted (use your GitHub username and PAT as password)."
            Write-Host " - The remote URL or permissions are incorrect."
            Write-Host "If you want to provide a PAT inline for a one-time push (not recommended), you can run:"
            Write-Host "  git push https://<USERNAME>:<PAT>@github.com/paruladlakha123/LearningPlaywright.git"
        }
    }

    Write-Host "Done. If the push failed due to authentication, create a PAT in GitHub (Settings → Developer settings → Personal access tokens) with 'repo' scope, then run this script again and paste the PAT when prompted by Git."
