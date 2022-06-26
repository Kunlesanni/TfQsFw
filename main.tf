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
    rule {
      name                  = "in_T_I_azdc_addev"
      protocols             = ["TCP", "UDP"]
      source_addresses      = ["10.0.0.1"]
      destination_addresses = ["192.168.1.1", "192.168.1.2"]
      destination_ports     = ["80", "1000-2000"]
    }
    rule {
      name                  = "in_U_I_azdc_addev"
      protocols             = ["TCP", "UDP"]
      source_addresses      = ["10.0.0.1"]
      destination_addresses = ["192.168.1.1", "192.168.1.2"]
      destination_ports     = ["80", "1000-2000"]
    }
    rule {
      name                  = "in_T_I_5722_azdc_addev"
      protocols             = ["TCP", "UDP"]
      source_addresses      = ["10.0.0.1"]
      destination_addresses = ["192.168.1.1", "192.168.1.2"]
      destination_ports     = ["80", "1000-2000"]
    }
    rule {
      name                  = "out_T_I_5722_azdc_addev"
      protocols             = ["TCP", "UDP"]
      source_addresses      = ["10.0.0.1"]
      destination_addresses = ["192.168.1.1", "192.168.1.2"]
      destination_ports     = ["80", "1000-2000"]
    }
    
  }
