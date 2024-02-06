resource "azurerm_windows_web_app" "example" {
  resource_group_name = var.resource_group_name
  name                = var.web_app_name
  location            = var.web_app_location
  service_plan_id     = var.azurerm_service_plan_id
                        
  site_config {
    application_stack {
              current_stack                = "dotnet"
              dotnet_version               = "v6.0"
            }
  }
}