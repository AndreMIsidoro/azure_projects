# Azure Basic Network and Linux VM Setup with Terraform

## Overview

This project uses Terraform to deploy a simple Azure infrastructure including:
- A Resource Group
- A Virtual Network (VNet) with a Subnet
- A Network Security Group (NSG) to allow SSH access
- A Network Interface (NIC) associated with the NSG
- A Linux Virtual Machine (Ubuntu 18.04) connected to the NIC



## Files

- `main.tf`: Contains the Terraform code for deploying all the Azure resources.

## Requirements

- Terraform installed
- Azure CLI authenticated (`az login`)
- An Azure subscription
- SSH key pair generated locally (`id_rsa`, `id_rsa.pub`)

## Setup Instructions

1. Initialize Terraform:

    ```bash
    terraform init
    ```

2. Validate the Configuration:

    ```bash
    terraform validate
    ```

3. Apply the Plan:

    ```bash
    terraform apply
    ```

4. Accessing the VM:

   - Using Public IP: Not configured (no public IP attached).
   - Using Private IP: SSH from Azure Cloud Shell:

    ```bash
    ssh -i <your-private-key> azureuser@<private-ip>
    ```

## Notes

- No Public IP is assigned to the VM to minimize costs and enhance security.
- SSH access is allowed within the virtual network via the Network Security Group.
- The VM size used is `Standard_B1s`, eligible for free-tier usage if under 750 hours per month.
- The Ubuntu 18.04 LTS image is chosen for simplicity and compatibility.
- Boot Diagnostics are not initially enabled — can be configured if deeper troubleshooting is needed.

## Cleanup

To destroy all resources created by this project:

```bash
terraform destroy
