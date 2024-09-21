# Initialize git repository
git init

# Create a file called junk
New-Item -Path . -Name "junk" -ItemType "file" -Force

# Prompt for beginning and end dates
$x = Read-Host "Enter Beginning date [yyyymmdd]"
$y = Read-Host "Enter End date [yyyymmdd]"

$DATE = $x

while ($DATE -le $y) {
    # Append 'a' to the file junk
    Add-Content -Path "./junk" -Value "a"

    # Stage all changes
    git add .

    # Commit with a message and custom date
    $msg = "commit$DATE"
    git commit -m $msg --date $DATE

    # Increment date by 1 day
    $DATE = (Get-Date $DATE).AddDays(1).ToString('yyyyMMdd')
}
