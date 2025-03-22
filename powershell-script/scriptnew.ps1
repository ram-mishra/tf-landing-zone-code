# Define the base path where the Terraform folder structure will be created
$basePath = "./Terraformfolder"

# Create the Terraform folder structure if it doesn't already exist
if (!(Test-Path -Path $basePath)) {
    New-Item -Path "." -Name "Terraformfolder" -ItemType Directory
}

# List of environment names where Terraform configuration will be stored
$environments = @("dev", "qa", "prod")

# List of Terraform files to create in each environment
$files = @("main.tf", "variables.tf", "terraform.tfvars", "provider.tf", "output.tf")

# Loop through each environment and create the necessary files and directories
foreach ($env in $environments) {
    # Define the path for the current environment
    $envPath = "$basePath/environment/$env"
    
    # Create environment directory if it doesn't already exist
    if (!(Test-Path -Path $envPath)) {
        New-Item -Path "$basePath/environment" -Name $env -ItemType Directory
    }

    # Create Terraform files in the environment directory if they don't exist
    foreach ($file in $files) {
        $filePath = "$envPath/$file"
        if (!(Test-Path -Path $filePath)) {
            New-Item -Path $envPath -Name $file -ItemType File -Force
        }
    }
}

# Define the path for Terraform modules directory
$modulesPath = "$basePath/modules"

# Create the modules directory if it doesn't already exist
if (!(Test-Path -Path $modulesPath)) {
    New-Item -Path $basePath -Name "modules" -ItemType Directory
}

# List of Terraform modules to create
$modules = @(
    "vnet-module", "rg-module", "vm-module", "akscluster-module", "acr-module",
    "bastion-module", "firewall-module", "udr-module", "keyvault-module",
    "appgateway-module", "frontdoor-module", "nsg-module"
)

# Loop through each module and create the necessary files and directories
foreach ($module in $modules) {
    # Define the path for the current module
    $modulePath = "$modulesPath/$module"
    
    # Create the module directory if it doesn't already exist
    if (!(Test-Path -Path $modulePath)) {
        New-Item -Path $modulesPath -Name $module -ItemType Directory -Force
    }

    # Create Terraform files in the module directory if they don't exist
    foreach ($file in $files) {
        $filePath = "$modulePath/$file"
        if (!(Test-Path -Path $filePath)) {
            New-Item -Path $modulePath -Name $file -ItemType File -Force
        }
    }
}

# Output message to confirm that the folder structure is created successfully
Write-Output "Terraform module structure created successfully."
