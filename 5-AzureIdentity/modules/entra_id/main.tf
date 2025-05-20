data "azurerm_client_config" "current" {} # retrieves metadata about the currently authenticated identity being used to run Terraform

locals {
  admin_role_id = "78a6e80a-b619-4cdd-9197-07a5a79a6e4e"
  user_role_id  = "3d0059fe-9832-4820-9b3c-8670598a3456"
}

resource "azuread_application" "java_spa" {
  display_name = "MySecureJavaApp"

  web {
    redirect_uris = ["http://localhost:8080/login/oauth2/code/azure"] # The URI where Azure AD will send the user back after they log in

    implicit_grant { #Enables Implicit Flow, where tokens (access and ID tokens) are returned directly in the redirect URL.
      access_token_issuance_enabled = true
      id_token_issuance_enabled     = true
    }
  }

  sign_in_audience = "AzureADMyOrg"  # single-tenant

  app_role {
      allowed_member_types = ["User"]
      description          = "Admins can access admin-only features"
      display_name         = "Admin"
      id                   = local.admin_role_id
      enabled           = true
      value                = "Admin"
    }
  app_role {
      allowed_member_types = ["User"]
      description          = "Users can access user features"
      display_name         = "User"
      id                   = local.user_role_id
      enabled           = true
      value                = "User"
    }
}

resource "azuread_service_principal" "java_spa_sp" {
  client_id = azuread_application.java_spa.client_id
}

#Admin creation and role assignment

data "azuread_user" "test_admin" {
  user_principal_name = "testadmin@andre92marcosoutlook.onmicrosoft.com"
}

resource "azuread_app_role_assignment" "admin" {
  principal_object_id = data.azuread_user.test_admin.object_id
  app_role_id         = "3d0059fe-9832-4820-9b3c-8670598a3456"  # User role ID
  resource_object_id  = azuread_service_principal.java_spa_sp.object_id
}

# User role assignment

data "azuread_user" "test_user" {
  user_principal_name = "testuser@andre92marcosoutlook.onmicrosoft.com"
}

resource "azuread_app_role_assignment" "user" {
  principal_object_id = data.azuread_user.test_user.object_id
  app_role_id         = "3d0059fe-9832-4820-9b3c-8670598a3456"  # User role ID
  resource_object_id  = azuread_service_principal.java_spa_sp.object_id
}