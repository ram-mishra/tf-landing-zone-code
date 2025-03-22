# Read token and login to Azure DevOps
$token = Get-Content token.txt
$token | az devops login --organization https://dev.azure.com/verizontelecom/

# Create a new repository and capture the remote URL
$repo = az repos create --name repo4 --project pwershell-project | ConvertFrom-Json
$remoteUrl = $repo.remoteUrl
Write-Output $remoteUrl

# Define paths
$excelPath = "./resourcegroup.xlsx"
$outputPath = "./terraform.tfvars"

# Import Excel data and create tfvars content
$excelData = Import-Excel -Path $excelPath -WorksheetName "Sheet1"
$tfvarsContent = "rgs = {"
foreach ($row in $excelData) {
    $tfvarsContent += "`n    $($row.'key') = {"
    $tfvarsContent += "`n        name = `"$($row.'rg_name')`""
    $tfvarsContent += "`n        location = `"$($row.'Location_name')`""
    $tfvarsContent += "`n    }"
}
$tfvarsContent += "`n}"

# Write tfvars content to file
$tfvarsContent | Out-File -FilePath $outputPath -Encoding UTF8
Write-Host "terraform.tfvars file has been created successfully at $outputPath"

