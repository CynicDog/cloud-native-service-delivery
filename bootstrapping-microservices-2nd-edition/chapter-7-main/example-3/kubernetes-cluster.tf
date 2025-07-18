resource "azurerm_kubernetes_cluster" "cluster" {
    name                = var.app_name
    location            = var.location
    resource_group_name = azurerm_resource_group.eunsang-iac-research.name
    dns_prefix          = var.app_name
    kubernetes_version  = var.kubernetes_version

    default_node_pool {
        name            = "default"
        node_count      = 1
        vm_size         = "Standard_B2s"
    }

    identity {
        type = "SystemAssigned"
    }
}

resource "azurerm_role_assignment" "aks_acr_pull" {
    scope                = azurerm_container_registry.container_registry.id
    role_definition_name = "AcrPull"
    principal_id         = azurerm_kubernetes_cluster.cluster.kubelet_identity[0].object_id
}