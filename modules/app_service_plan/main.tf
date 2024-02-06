
resource "azurerm_service_plan" "example" {
 resource_group_name  = var.resource_group_name
  name                = var.app_service_plan_name
  location            = var.app_service_plan_location
  sku_name            = "P1v2"
  os_type             = "Windows"
  
}


