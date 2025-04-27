# Azure Basic Network and Multiple Linux VMs Setup with Terraform

## Overview

This project uses Terraform to deploy a basic Azure infrastructure, which includes:

- A Resource Group
- A Virtual Network (VNet) with a Subnet
- A Network Security Group (NSG) to allow SSH access
- Multiple Network Interfaces (NICs) attached to the VMs
- Multiple Linux Virtual Machines (Ubuntu 18.04) connected to the NICs

The project demonstrates how to create a simple network setup with multiple virtual machines, making use of Terraform modules for better organization and scalability.

## Files

- `main.tf`: Contains the Terraform code for deploying the infrastructure, including resources like Resource Group, VNet, Subnet, NSG, NICs, and VMs.
- `modules/`: Directory containing the Terraform modules for the network and virtual machine resources.
- `variables.tf`: Defines the input variables for configuring the infrastructure.
- `terraform.tfvars`: A file that contains the variable values used to configure the Terraform deployment (e.g., resource group name, location, VM size, etc.). This file is used to provide values for the variables defined in `variables.tf`.
- `outputs.tf`: Contains output variables, such as the private IP addresses of the VMs.

## Requirements

- Terraform installed (version 0.12 or later)
- Azure CLI authenticated (`az login`)
- An Azure subscription
- SSH key pair generated locally (`id_rsa`, `id_rsa.pub`)


### Required Environment Variables

This project uses Azure CLI authentication.  
Set the following environment variables **before** running `terraform plan` or `terraform apply`:

| Variable               | Description                                            |
|-------------------------|--------------------------------------------------------|
| `ARM_USE_AZURECLI_AUTH` | Set to `true` to authenticate Terraform via Azure CLI. |
| `ARM_SUBSCRIPTION_ID`   | Your Azure Subscription ID.                           |
| `TF_VAR_ssh_public_key_path`   | Path to public ssh key                           |

Example:

```bash
export ARM_USE_AZURECLI_AUTH=true
export ARM_SUBSCRIPTION_ID=<your-subscription-id>
export TF_VAR_ssh_public_key_path="<path_to_ssh_key>"
```

## Outputs

After running `terraform apply`, Terraform will display the following outputs:

- `vm_private_ips`: List of private IP addresses of the created VMs.

You can also retrieve the outputs using:

```bash
terraform output
```



