provider "azurerm" {
  alias           = "hubc"
  subscription_id = "effec6ac-0c2f-40d8-ac3e-7ea8f2116d46"
  tenant_id       = "1faf88fe-a998-4c5b-93c9-210a11d9a5c2"
  client_id       = "8a0a2e91-fbc1-4606-bc1f-d43c84fd2aa8"
  client_secret   = "Cvc8Q~TFVrkTkElEoG58NsiOwHn5EjJxC6YqLbgY"
  features {}
}

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
