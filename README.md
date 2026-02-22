# LearningPlaywright

Collection of Playwright example scripts and tests, organized by chapter.

## Project structure

- `chapter_01_basics/` — basic Playwright examples
- `chapter_02_java_concepts/` — placeholder for Java concept notes

## Setup

1. Install Node.js (LTS recommended)
2. From the repo root run:

```powershell
npm install
```

3. Install Playwright browsers (if you use Playwright):

```powershell
npx playwright install --with-deps
```

## Running tests

If the project contains Playwright tests, run:

```powershell
npx playwright test
```

## CI

This repository includes a GitHub Actions workflow that runs Playwright tests on push and pull requests.

## Pushing to GitHub (from your machine)

```powershell
cd C:\LearningPlaywright
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/paruladlakha123/LearningPlaywright.git
git push -u origin main
```

If push fails due to authentication, create a Personal Access Token (PAT) and use it instead of your password, or set up SSH keys.

## License

This project is licensed under the MIT License — see `LICENSE`.
