## Jamf Pro provider root configuration
provider "jamfpro" {
  jamfpro_instance_fqdn                = var.jamfpro_instance_url
  auth_method                          = var.jamfpro_auth_method
  basic_auth_username                  = var.jamfpro_username
  basic_auth_password                  = var.jamfpro_password
  client_id                            = var.jamfpro_client_id
  client_secret                        = var.jamfpro_client_secret
  enable_client_sdk_logs               = false
  hide_sensitive_data                  = true # Hides sensititve data in logs
  token_refresh_buffer_period_seconds  = 5    # minutes
  jamfpro_load_balancer_lock           = true
  mandatory_request_delay_milliseconds = 100
}

# JSC provider root configuration
provider "jsc" {
  username          = var.jsc_username
  password          = var.jsc_password
  applicationid     = var.jsc_applicationid
  applicationsecret = var.jsc_applicationsecret
}

## Initialize Jamf Pro

module "config-jamf-pro-smart-groups" {
  count                 = var.include_smart_groups == true ? 1 : 0
  source                = "./modules/config-jamf-pro-smart-groups"
  jamfpro_instance_url  = var.jamfpro_instance_url
  jamfpro_client_id     = var.jamfpro_client_id
  jamfpro_client_secret = var.jamfpro_client_secret
  providers = {
    jamfpro.jpro = jamfpro.jpro
  }
}

module "config-jamf-pro-categories" {
  count                 = var.include_categories == true ? 1 : 0
  source                = "./modules/config-jamf-pro-categories"
  jamfpro_instance_url  = var.jamfpro_instance_url
  jamfpro_client_id     = var.jamfpro_client_id
  jamfpro_client_secret = var.jamfpro_client_secret
  providers = {
    jamfpro.jpro = jamfpro.jpro
  }
}

module "config-jamf-pro-prestages" {
  count                 = var.include_categories == true ? 1 : 0
  source                = "./modules/config-jamf-pro-prestages"
  jamfpro_instance_url  = var.jamfpro_instance_url
  jamfpro_client_id     = var.jamfpro_client_id
  jamfpro_client_secret = var.jamfpro_client_secret
  providers = {
    jamfpro.jpro = jamfpro.jpro
  }
}

module "config-jamf-pro-computer-management" {
  count                 = var.include_computer_management == true ? 1 : 0
  source                = "./modules/config-jamf-pro-computer-management"
  jamfpro_instance_url  = var.jamfpro_instance_url
  jamfpro_client_id     = var.jamfpro_client_id
  jamfpro_client_secret = var.jamfpro_client_secret
  providers = {
    jamfpro.jpro = jamfpro.jpro
  }
}

module "config-jamf-pro-aviation-mobile" {
  count                 = var.include_computer_management == true ? 1 : 0
  source                = "./modules/config-jamf-pro-aviation-mobile"
  jamfpro_instance_url  = var.jamfpro_instance_url
  jamfpro_client_id     = var.jamfpro_client_id
  jamfpro_client_secret = var.jamfpro_client_secret
  home_screen_layouts_category_id = module.config-jamf-pro-categories[0].home_screen_layouts_category_id
  providers = {
    jamfpro.jpro = jamfpro.jpro
  }
}