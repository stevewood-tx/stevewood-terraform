## Call Terraform provider
terraform {
  required_providers {
    jamfpro = {
      source                = "deploymenttheory/jamfpro"
      configuration_aliases = [jamfpro.jpro]
    }
  }
}

## Extension Attribute

resource "jamfpro_mobile_device_extension_attribute" "role" {
  name                   = "Role"
  description            = "Holds the role value passed from Jamf Setup or Jamf Mobile Assist."
  data_type              = "STRING"
  inventory_display_type = "USER_AND_LOCATION"

  input_type = "TEXT"
}

## Create Smart Groups
resource "jamfpro_smart_mobile_device_group" "aviation_null" {
  name = "[Aviation] Null Devices"

  criteria {
    name        = jamfpro_mobile_device_extension_attribute.role.name
    priority    = 0
    search_type = "is"
    value       = ""
    and_or      = "and"
  }
    criteria {
    name        = "Enrollment Method: PreStage enrollment"
    priority    = 1
    search_type = "is"
    value       = "Aviation Mobile Prestage"
  }
}

resource "jamfpro_smart_mobile_device_group" "aviation_all_devices" {
  name = "[Aviation] All Devices"

    criteria {
    name        = "Enrollment Method: PreStage enrollment"
    priority    = 0
    search_type = "is"
    value       = "Aviation Mobile Prestage"
  }
}

resource "jamfpro_smart_mobile_device_group" "aviation_gate_devices" {
  name = "[Aviation] Gate Devices"

  criteria {
    name        = jamfpro_mobile_device_extension_attribute.role.name
    priority    = 0
    search_type = "is"
    value       = "Gate"
    and_or      = "and"
  }
    criteria {
    name        = "Enrollment Method: PreStage enrollment"
    priority    = 1
    search_type = "is"
    value       = "Aviation Mobile Prestage"
  }
}

resource "jamfpro_smart_mobile_device_group" "aviation_pilot_devices" {
  name = "[Aviation] Pilot Devices"

  criteria {
    name        = jamfpro_mobile_device_extension_attribute.role.name
    priority    = 0
    search_type = "is"
    value       = "Pilot"
    and_or      = "and"
  }
    criteria {
    name        = "Enrollment Method: PreStage enrollment"
    priority    = 1
    search_type = "is"
    value       = "Aviation Mobile Prestage"
  }
}

resource "jamfpro_smart_mobile_device_group" "aviation_mechanic_devices" {
  name = "[Aviation] Mechanic Devices"

  criteria {
    name        = jamfpro_mobile_device_extension_attribute.role.name
    priority    = 0
    search_type = "is"
    value       = "Mechanic"
    and_or      = "and"
  }
    criteria {
    name        = "Enrollment Method: PreStage enrollment"
    priority    = 1
    search_type = "is"
    value       = "Aviation Mobile Prestage"
  }
}

## Config Profiles
resource "jamfpro_mobile_device_configuration_profile_plist" "aviation_gate_device_homescreen" {
  name               = "[Aviation] Gate Devices"
  description        = "Set the home screen layout for gate devices."
  deployment_method  = "Install Automatically"
  level              = "Device Level"
  category_id        = var.home_screen_layouts_category_id
  redeploy_on_update = "Newly Assigned"
  payloads           = file("${path.module}/support_files/aviation_gate_agent_devices.mobileconfig")

  scope {
    all_mobile_devices  = false
    all_jss_users       = false
    #mobile_device_group_ids = [tonumber(jamfpro_smart_mobile_device_group.aviation_gate_devices.id)]
    mobile_device_group_ids = [jamfpro_smart_mobile_device_group.aviation_gate_devices.id]
  }
}