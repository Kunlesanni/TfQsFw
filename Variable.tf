Variable "rg" {
      default = ""
      description = "Name of resource Group hwere the Firewall resource is"
}

Variable "rule1" {
type = map(string)
description = "Details of rule to be applied"
default = {
      name                  = "in_T_I_azdc_addev"
      protocols             = ["TCP", "UDP"]
      source_addresses      = ["10.0.0.1"]
      destination_addresses = ["192.168.1.1", "192.168.1.2"]
      destination_ports     = ["80", "1000-2000"]
    }
}

Variable "rule2" {
type = map(string)
description = "Details of rule to be applied"
default = {
      name                  = "in_U_I_azdc_addev"
      protocols             = ["TCP", "UDP"]
      source_addresses      = ["10.0.0.1"]
      destination_addresses = ["192.168.1.1", "192.168.1.2"]
      destination_ports     = ["80", "1000-2000"]
    }
}

Variable "rule3" {
type = map(string)
description = "Details of rule to be applied"
default = {
      name                  = "in_T_I_5722_azdc_addev"
      protocols             = ["TCP", "UDP"]
      source_addresses      = ["10.0.0.1"]
      destination_addresses = ["192.168.1.1", "192.168.1.2"]
      destination_ports     = ["80", "1000-2000"]
    }
}

Variable "rule4" {
type = map(string)
description = "Details of rule to be applied"
default = {
      name                  = "out_T_I_5722_azdc_addev"
      protocols             = ["TCP", "UDP"]
      source_addresses      = ["10.0.0.1"]
      destination_addresses = ["192.168.1.1", "192.168.1.2"]
      destination_ports     = ["80", "1000-2000"]
    }
}
