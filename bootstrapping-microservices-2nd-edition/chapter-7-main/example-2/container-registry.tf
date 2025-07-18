resource "azurerm_container_registry" "container_registry" {
  name                = "eunsangacr01"
  resource_group_name = azurerm_resource_group.eunsang-iac-research.name
  location            = "Korea Central"
  admin_enabled       = true
  sku                 = "Basic"
}

output "registry_hostname" {
  value = azurerm_container_registry.container_registry.login_server
}

output "registry_un" {
  value = azurerm_container_registry.container_registry.admin_username
}

output "registry_pw" {
  value = azurerm_container_registry.container_registry.admin_password
  sensitive = true
}
