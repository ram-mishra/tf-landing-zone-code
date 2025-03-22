# Ensure required modules are installed and imported
# Install-Module -Name ImportExcel -Scope CurrentUser -Force -SkipPublisherCheck
Import-Module ImportExcel
# Connect-AzAccount

# Get storage accounts in 'centralindia' location
$storageAccounts = az storage account list --query "[?location=='centralindia']" --output json | ConvertFrom-Json

# Define output file path
$outputPath = "C:\Users\r3mishra\Documents\DevopsClass\powershell-Practice\report.xlsx"

# Create an array for Excel export
$exportData = $storageAccounts | ForEach-Object {
    [PSCustomObject]@{
        "Storage Account Name" = $_.name
        "Location"             = $_.location
        "Resource Group"       = $_.resourceGroup
    }
}

# Export to Excel
$exportData | Export-Excel -Path $outputPath -WorksheetName "CentralIndiaStorage" -AutoSize -BoldTopRow

Write-Host "Report generated successfully at $outputPath"
