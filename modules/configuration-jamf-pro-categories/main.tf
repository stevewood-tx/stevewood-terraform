## Call Terraform provider
terraform {
  required_providers {
    jamfpro = {
      source                = "deploymenttheory/jamfpro"
      configuration_aliases = [jamfpro.jpro]
    }
  }
}

## Categories not specific to an "outcome". If relative to an outcome the category is created in the specific outcome module

## Create Categories

resource "jamfpro_category" "applications" {
  name     = "Applications"
  priority = 9
}

resource "jamfpro_category" "provisioning" {
  name     = "Provisioning"
  priority = 9
}

resource "jamfpro_category" "utilities" {
  name     = "Utilities"
  priority = 9
}

resource "jamfpro_category" "zinstallers" {
  name     = "zInstallers"
  priority = 9
}

resource "jamfpro_category" "certificates" {
  name     = "Certificates"
  priority = 9
}

resource "jamfpro_category" "home_screen_layouts" {
  name     = "Home Screen Layouts"
  priority = 9
}

resource "jamfpro_category" "network_settings" {
  name     = "Network Settings"
  priority = 9
}

resource "jamfpro_category" "security" {
  name     = "Security"
  priority = 9
}

resource "jamfpro_category" "settings" {
  name     = "Settings"
  priority = 9
}