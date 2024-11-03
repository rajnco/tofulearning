output "acr_url" {
  value = azurerm_container_registry.arm-acr.login_server
}

output "admin_username" {
  value = azurerm_container_registry.arm-acr.admin_username
  #sensitive = true
}

#output "admin_password" {
  #value = azurerm_container_registry.arm-acr.admin_password
  #sensitive = true
#}
