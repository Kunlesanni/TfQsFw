data "azurerm_resource_group" "rgdata" {
  name = "rg"
}

data "azurerm_firewall_policy" "afpdata" {
  name                = "var.afp"
  resource_group_name = "data.azurerm_resource_group.rgdata.name"
}

resource "azurerm_firewall_policy_rule_collection_group" "rcgname" {
  name               = "var.rcg"
  firewall_policy_id = data.azurerm_firewall_policy.afpdata.id
  priority           = 500
  
  network_rule_collection {
    name     = "azure_dcs"
    priority = 400
    action   = "Deny"
    rule = var.rule1
    rule = var.rule2
    rule = var.rule3
    rule = var.rule4   
  }
}
