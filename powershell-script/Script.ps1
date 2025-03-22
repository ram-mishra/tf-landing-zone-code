New-Item -Path "." -Name Terraformfolder -ItemType Directory
New-Item -Path "./Terraformfolder" -Name "environment" -ItemType Directory
New-Item -Path "./Terraformfolder" -Name "environment/dev" -ItemType Directory
New-Item -Path "./Terraformfolder" -Name "environment/dev/main.tf" -ItemType File
New-Item -Path "./Terraformfolder" -Name "environment/dev/variables.tf" -ItemType File
New-Item -Path "./Terraformfolder" -Name "environment/dev/terraform.tfvars" -ItemType File
New-Item -Path "./Terraformfolder" -Name "environment/dev/provider.tf" -ItemType File
New-Item -Path "./Terraformfolder" -Name "environment/dev/output.tf" -ItemType File
New-Item -Path "./Terraformfolder" -Name "environment/qa" -ItemType Directory
New-Item -Path "./Terraformfolder" -Name "environment/qa/main.tf" -ItemType File
New-Item -Path "./Terraformfolder" -Name "environment/qa/variables.tf" -ItemType File
New-Item -Path "./Terraformfolder" -Name "environment/qa/terraform.tfvars" -ItemType File
New-Item -Path "./Terraformfolder" -Name "environment/qa/provider.tf" -ItemType File
New-Item -Path "./Terraformfolder" -Name "environment/qa/output.tf" -ItemType File
New-Item -Path "./Terraformfolder" -Name "environment/prod" -ItemType Directory
New-Item -Path "./Terraformfolder" -Name "environment/prod/main.tf" -ItemType File
New-Item -Path "./Terraformfolder" -Name "environment/prod/variables.tf" -ItemType File
New-Item -Path "./Terraformfolder" -Name "environment/prod/terraform.tfvars" -ItemType File
New-Item -Path "./Terraformfolder" -Name "environment/prod/provider.tf" -ItemType File
New-Item -Path "./Terraformfolder" -Name "environment/prod/output.tf" -ItemType File
New-Item -Path "./Terraformfolder" -Name "modules" -ItemType Directory

# Define the base path
$basePath = "./Terraformfolder/modules"

# Define the module names
$modules = @("vnet-module", "rg-module", "vnet-module", "vm-module", "akscluster-module", "acr-module", "bastion-module", "firewall-module", "udr-module", "keyvault-module", "appgateway-module", "frontdoor-module", "nsg-module")

# Loop through each module and create directories and files
foreach ($module in $modules) {
    New-Item -Path $basePath -Name $module -ItemType Directory -Force
    New-Item -Path "$basePath/$module" -Name "main.tf" -ItemType File -Force
    New-Item -Path "$basePath/$module" -Name "variables.tf" -ItemType File -Force
    New-Item -Path "$basePath/$module" -Name "output.tf" -ItemType File -Force
}

Write-Output "Terraform module structure created successfully."
