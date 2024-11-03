
variable resource_group_name {
  description = "resource group name"
}

variable location {
  description = "resource location"
}

resource "azurerm_resource_group" "azurerg" {
  name = var.resource_group_name
  location = var.location
}

resource "azurerm_service_plan" "appservice" {
  name = "LinuxBox2"
  resource_group_name = azurerm_resource_group.azurerg.name
  location = azurerm_resource_group.azurerg.location 
  sku_name = "F1"
  os_type = "Linux"
}

resource "azurerm_linux_web_app" "webappservice" {
  name = "LinuxWeb2"
  resource_group_name = azurerm_resource_group.azurerg.name
  location = azurerm_resource_group.azurerg.location 
  service_plan_id = azurerm_service_plan.appservice.id

  site_config {
    always_on = false    
    application_stack{
      docker_image_name = "nginx:latest"
      docker_registry_url = "https://index.docker.io"
    }
  }

  app_settings = {
    DOCKER_ENABLE_CI = true
  }

}
