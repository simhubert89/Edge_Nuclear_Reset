##### Edge Nuclear Cleanup By wuddy #####
# Edge_Nuclear_Reset.ps1

# Ferme tous les processus Microsoft Edge
Write-Host "Fermeture de tous les processus Microsoft Edge..." -ForegroundColor Yellow
taskkill /F /IM msedge.exe /T 2>$null

# Récupère tous les dossiers des utilisateurs locaux de Windows
$users = Get-ChildItem "C:\Users" -Directory |
    Where-Object { Test-Path "$($_.FullName)\AppData\Local\Microsoft\Edge\User Data" }

# Supprime tous les profils Edge (User Data) pour tous les utilisateurs
foreach ($user in $users) {
    $edgeUserData = Join-Path $user.FullName "AppData\Local\Microsoft\Edge\User Data"
    
    Write-Host "Suppression des données Edge depuis : $edgeUserData" -ForegroundColor Cyan
    Remove-Item $edgeUserData -Recurse -Force -Verbose -ErrorAction SilentlyContinue
}

# Attend quelques secondes ❤️
Start-Sleep -Seconds 2
