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

resource "jamfpro_category" "category_applications" {
  name     = "Applications"
  priority = 9
}

resource "jamfpro_category" "category_utilities" {
  name     = "Utilities"
  priority = 9
}

resource "jamfpro_category" "category_zinstallers" {
  name     = "zInstallers"
  priority = 9
}

resource "jamfpro_category" "category_provisioning" {
  name     = "Provisioning"
  priority = 9
}

resource "jamfpro_category" "category_productivity" {
  name     = "Productivity"
  priority = 9
}

resource "jamfpro_category" "category_security_compliance" {
  name     = "Security and Compliance"
  priority = 9
}

resource "jamfpro_category" "category_settings" {
  name     = "Settings"
  priority = 9
}

resource "jamfpro_category" "category_jamf_protect" {
  name     = "Jamf Protect"
  priority = 9
}

resource "jamfpro_category" "category_home_screen_layouts" {
  name     = "Home Screen Layouts"
  priority = 9
}