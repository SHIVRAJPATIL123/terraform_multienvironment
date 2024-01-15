module "RG" {
  source                  = "./modules/RG"
  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location
}

module "app_service_plan" {
 source                    = "./modules/app_service_plan" 
 resource_group_name       = module.RG.resource_group_name
 resource_group_location   = module.RG.resource_group_location
 app_service_plan_name     = "${module.RG.resource_group_name}-serviceplan"
 app_service_plan_location = module.RG.resource_group_location
 azurerm_service_plan      = var.azurerm_service_plan

}

module "web_app" {
 source                    = "./modules/web_app"
 resource_group_name       = module.RG.resource_group_name
 resource_group_location   = module.RG.resource_group_location
 web_app_name              = var.web_app_name
 web_app_location          = module.RG.resource_group_location
 dotnet_framework_version  = var.dotnet_framework_version
 azurerm_service_plan_id   = module.app_service_plan.azurerm_service_plan_id
}