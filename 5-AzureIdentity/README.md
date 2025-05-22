# AzureEntraApp

A Spring Boot web application demonstrating OAuth2 login with **Azure Entra ID (Azure AD)**. It authenticates users using Microsoft identity platform, with roles (Admin/User) configured via Terraform.

---

## Tech Stack

- Java 17+
- Spring Boot 3.4.x
- Spring Security + OAuth2 Client
- Thymeleaf (UI)
- Terraform (for Azure AD configuration)
- Azure Entra ID (formerly Azure Active Directory)

---

## Features

- OAuth2 login via Azure Entra ID
- Role-based access control (Admin/User)
- Thymeleaf UI with login/logout flow
- Users and app roles managed via Terraform
- Supports both `localhost` and `127.0.0.1` redirects