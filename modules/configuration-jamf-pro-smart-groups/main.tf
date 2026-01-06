## Call Terraform provider
terraform {
  required_providers {
    jamfpro = {
      source                = "deploymenttheory/jamfpro"
      configuration_aliases = [jamfpro.jpro]
    }
  }
}

## Create Smart Computer Groups - Quality Of Life
resource "jamfpro_smart_computer_group" "group_last_checkin" {
  name = "*7 Days Since Last Check-In"
  criteria {
    name        = "Last Check-in"
    search_type = "more than x days ago"
    value       = "7"
    and_or      = "and"
    priority    = 0
  }
}
