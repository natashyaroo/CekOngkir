# Initialize git repository
git init

# Create a file called junk
New-Item -Path . -Name "junk" -ItemType "file" -Force

# Prompt for beginning and end dates
$x = Read-Host "Enter Beginning date [yyyymmdd]"
$y = Read-Host "Enter End date [yyyymmdd]"

# Parse the dates using the correct format
$DATE = [DateTime]::ParseExact($x, 'yyyyMMdd', $null)
$endDate = [DateTime]::ParseExact($y, 'yyyyMMdd', $null)

while ($DATE -le $endDate) {
    # Append 'a' to the file junk
    Add-Content -Path "./junk" -Value "a"

    # Stage all changes
    git add .

    # Commit with a message and custom date
    $msg = "commit" + $DATE.ToString('yyyyMMdd')
    git commit -m $msg --date $DATE.ToString("R")

    # Increment date by 1 day
    $DATE = $DATE.AddDays(1)
}
