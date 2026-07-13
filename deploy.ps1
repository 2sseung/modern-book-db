# GitHub Pages deploy for 근대식 출판 단행본 DB
$ErrorActionPreference = "Stop"
$gh = "C:\Program Files\GitHub CLI\gh.exe"
Set-Location "C:\Users\user\Desktop\근대서지\prototype"

$owner = (& $gh api user -q .login).Trim()
Write-Host "OWNER: $owner"

# 1) create public repo from current dir and push existing commit
& $gh repo create modern-book-db --public --source=. --remote=origin --push --description "Modern Korean monograph bibliography DB (prototype)"

# 2) enable GitHub Pages from main branch root
'{"source":{"branch":"main","path":"/"}}' | & $gh api -X POST "repos/$owner/modern-book-db/pages" --input -

Write-Host ""
Write-Host "=== DEPLOY OK ==="
Write-Host "REPO: https://github.com/$owner/modern-book-db"
Write-Host "SITE: https://$owner.github.io/modern-book-db/"
