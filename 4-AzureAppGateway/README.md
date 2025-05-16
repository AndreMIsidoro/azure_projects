# Azure Learning Project: Scalable, Secure Cloud Architecture

## Overview

This project is a **cost-conscious, learning-focused Azure infrastructure** built using **Terraform**. It demonstrates a scalable, secure, and observable architecture integrating a variety of Azure services. The system is designed for hosting open-source applications (like Jenkins and Nextcloud) behind a fully managed, TLS-secured frontend, with centralized identity, monitoring, and access control.

---

## Architecture Summary

### Frontend Layer
- **Azure Application Gateway **  
  - TLS termination  
  - Reverse proxy to internal NGINX instance  
  - Routing based on subdomains (`*.azurewebsites.net`)

- **Azure DNS / default `azurewebsites.net` subdomains**  
  - No custom domain required  
  - Subdomains map to Jenkins/Nextcloud services

- **NGINX in VM**  
  - Reverse proxy for internal services (vhosts)  
  - Receives HTTP from App Gateway  
  - Forwards to VMSS-based services

---

### Backend Layer
- **Azure Virtual Machine Scale Set (VMSS)**  
  - Hosts:
    - Jenkins CI/CD Server
    - Nextcloud File Collaboration Platform  
  - Scales automatically
  - No public IP — internal access only

- **Azure Bastion**  
  - Secure, browser-based RDP/SSH into VMSS  
  - Eliminates need for public SSH ports

---


---

### Development & Staging
- **Terraform** used to provision and manage all infrastructure  
- **Staging subnet/tenant** available to test Entra ID + SSO integrations  
- Budget and monitoring help prevent unintended costs during learning

---

## Technologies & Services Used

| Area           | Services / Features                                                              |
|----------------|-----------------------------------------------------------------------------------|
| Compute        | Azure VMSS, Azure Container Instances, Azure Bastion                              |
| Networking     | Azure VNet, Subnets, Azure Application Gateway, Azure Firewall, Azure DNS         |
| Applications   | Jenkins (CI/CD), Nextcloud (storage/collaboration)                               |

---

---


## Goals

- Hands-on experience with Azure IaaS, PaaS
- Practice real-world architecture patterns (reverse proxy, vhosts)
- Learn to operate Azure at scale with observability and cost-awareness

---

