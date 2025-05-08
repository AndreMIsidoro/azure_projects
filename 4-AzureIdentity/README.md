# Azure Learning Project: Scalable, Secure Cloud Architecture

## Overview

This project is a **cost-conscious, learning-focused Azure infrastructure** built using **Terraform**. It demonstrates a scalable, secure, and observable architecture integrating a variety of Azure services. The system is designed for hosting open-source applications (like Jenkins and Nextcloud) behind a fully managed, TLS-secured frontend, with centralized identity, monitoring, and access control.

---

## Architecture Summary

### Frontend Layer
- **Azure Application Gateway (WAF enabled)**  
  - TLS termination  
  - Reverse proxy to internal NGINX instance  
  - Routing based on subdomains (`*.azurewebsites.net`)

- **Azure DNS / default `azurewebsites.net` subdomains**  
  - No custom domain required  
  - Subdomains map to Jenkins/Nextcloud services

- **NGINX in Azure Container Instance (ACI)**  
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

- **Azure SQL Database**  
  - Managed relational database for Nextcloud

- **Azure Storage Account**  
  - Blob storage for Nextcloud file backend  
  - Logs, state, and artifacts

---

### Identity & Access
- **Azure Entra ID (formerly Azure AD)**  
  - Central identity provider  
  - SSO for Jenkins & Nextcloud via OAuth2/SAML  
  - Azure RBAC for resource-level access

- **Azure RBAC Roles**  
  - Custom and built-in roles following least privilege  
  - Role assignments mapped per resource scope

- **Managed Identities**  
  - Used by VMSS, Azure Functions, NGINX container  
  - Access Azure Key Vault and Storage securely

---

### Security
- **Azure Key Vault**  
  - Stores secrets, TLS certs, and credentials  
  - Access controlled via Managed Identities

- **Azure Firewall**  
  - Controls egress/ingress from subnets  
  - Monitored for rule hits and threats

---

### Observability & Cost Management
- **Azure Monitor + Log Analytics**  
  - Centralized logs from App Gateway, VMSS, ACI, and Firewall  
  - Custom dashboards and alerting

- **Azure Cost Management + Budgets**  
  - Cost views per resource group or tag  
  - Budget alerts at 50/75/90% thresholds  
  - Tracks impact of autoscaling and outbound data

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
| Storage        | Azure SQL Database, Azure Blob Storage                                            |
| Security       | Azure Key Vault, Managed Identities, Azure RBAC, NSGs                             |
| Identity       | Azure Entra ID, Azure Role Assignments, SAML/OAuth2 for SSO                       |
| Monitoring     | Azure Monitor, Log Analytics, Cost Management + Budgets                          |
| Applications   | Jenkins (CI/CD), Nextcloud (storage/collaboration)                               |

---

## Getting Started

> Follow the phase-based implementation plan (in a separate document) to deploy each layer safely and progressively.

1. Provision **Networking and Core Resources**
2. Deploy **Application Gateway** and **NGINX ACI**
3. Deploy and secure **VMSS + Bastion**
4. Set up **Jenkins** and **Nextcloud**
5. Integrate with **Azure SQL** and **Storage**
6. Configure **SSO with Entra ID**
7. Set up **Monitoring** and **Budgets**

---

## Notes

- Entra ID integration is tested in staging before production
- This is a **low-cost, learn-as-you-go** environment — avoid overprovisioning
- The system is modular and can be extended with additional services as needed

---

## Goals

- Hands-on experience with Azure IaaS, PaaS, identity, and security
- Practice real-world architecture patterns (reverse proxy, vhosts, RBAC)
- Learn to operate Azure at scale with observability and cost-awareness

---

