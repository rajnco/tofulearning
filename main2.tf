
variable "resource_group_name" {
  description = "Resource Group Name"
} 

variable resource_region {
  description = "Resource Group Region"
}

resource "azurerm_resource_group" "arm-acr-group" {
  name = var.resource_group_name 
  location = var.resource_region
}

resource "azurerm_container_registry" "arm-acr" {
  name = "rajopentofu"
  resource_group_name = azurerm_resource_group.arm-acr-group.name
  # location = azurerm_resource_group.arm-acr-group.location 
  location = var.resource_region
  sku = "Basic"
  admin_enabled = true
  
  tags = {
    env = "dev"
  }
}
