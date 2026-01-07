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

## Create Computer Prestage Enrollments
// Minimum Configuration

resource "jamfpro_computer_prestage_enrollment" "default" {
  display_name                          = "Default Enrollment"
  mandatory                             = true
  mdm_removable                         = true
  support_phone_number                  = ""
  support_email_address                 = "support@geekygordo.com"
  department                            = ""
  default_prestage                      = false
  enrollment_site_id                    = "-1"
  keep_existing_site_membership         = false
  keep_existing_location_information    = false
  require_authentication                = false
  authentication_prompt                 = ""
  prevent_activation_lock               = true
  enable_device_based_activation_lock   = false
  device_enrollment_program_instance_id = "1"
  skip_setup_items {
    biometric            = false
    additional_privacy_settings = false
    software_update = false
    terms_of_address     = false
    file_vault           = false
    icloud_diagnostics   = false
    diagnostics          = false
    accessibility        = false
    apple_id             = false
    screen_time          = false
    siri                 = false
    display_tone         = false
    restore              = false
    appearance           = false
    privacy              = false
    payment              = false
    registration         = false
    tos                  = false
    icloud_storage       = false
    location             = false
    intelligence         = false
    enable_lockdown_mode = false
    welcome              = false
    wallpaper            = false
    os_showcase          = false
  }
  location_information {
    username      = ""
    realname      = ""
    phone         = ""
    email         = ""
    room          = ""
    position      = ""
    department_id = "-1"
    building_id   = "-1"
  }
  purchasing_information {
    leased             = false
    purchased          = true
    apple_care_id      = ""
    po_number          = ""
    vendor             = ""
    purchase_price     = ""
    life_expectancy    = 0
    purchasing_account = ""
    purchasing_contact = ""
    lease_date         = "1970-01-01"
    po_date            = "1970-01-01"
    warranty_date      = "1970-01-01"
  }
  anchor_certificates                     = []
  enrollment_customization_id             = "0"
  language                                = ""
  region                                  = ""
  auto_advance_setup                      = true
  install_profiles_during_setup           = true
  prestage_installed_profile_ids          = []
  custom_package_ids                      = []
  custom_package_distribution_point_id    = "-2"
  enable_recovery_lock                    = false
  recovery_lock_password_type             = "MANUAL" // "MANUAL" / "RANDOM"
  recovery_lock_password                  = ""
  rotate_recovery_lock_password           = false
  prestage_minimum_os_target_version_type = "NO_ENFORCEMENT"
  minimum_os_specific_version             = ""
  site_id                                 = "-1"
  account_settings {
    payload_configured                           = true
    local_admin_account_enabled                  = true
    admin_username                               = "jamf_mdm"
    admin_password                               = "jamf_mdm"
    hidden_admin_account                         = true
    local_user_managed                           = false
    user_account_type                            = "ADMINISTRATOR"
    prefill_primary_account_info_feature_enabled = false
    prefill_type                                 = "UNKNOWN"
    prefill_account_full_name                    = ""
    prefill_account_user_name                    = ""
    prevent_prefill_info_from_modification       = false
  }
}

## mobile Device Prestage Enrollment

resource "jamfpro_mobile_device_prestage_enrollment" "default_mobile_prestage" {
  display_name                            = "Default Mobile Prestage"
  mandatory                               = true
  mdm_removable                           = false
  support_phone_number                    = ""
  support_email_address                   = "support@geekygordo.com"
  department                              = ""
  default_prestage                        = false
  enrollment_site_id                      = "-1"
  keep_existing_site_membership           = false
  keep_existing_location_information      = false
  require_authentication                  = false
  authentication_prompt                   = ""
  prevent_activation_lock                 = true
  enable_device_based_activation_lock     = false
  device_enrollment_program_instance_id   = "1"
  enrollment_customization_id             = "0"
  language                                = ""
  region                                  = ""
  auto_advance_setup                      = false
  allow_pairing                           = false
  multi_user                              = false
  supervised                              = true
  maximum_shared_accounts                 = 10
  configure_device_before_setup_assistant = true
  site_id                                 = "-1"
  anchor_certificates                     = []

 skip_setup_items {
    location                = false
    privacy                 = false
    biometric               = false
    software_update         = false
    diagnostics             = false
    imessage_and_facetime   = false
    intelligence            = false
    tv_room                 = false
    passcode                = false
    sim_setup               = false
    screen_time             = false
    restore_completed       = false
    tv_provider_sign_in     = false
    siri                    = false
    restore                 = false
    screen_saver            = false
    home_button_sensitivity = false
    cloud_storage           = false
    action_button           = false
    transfer_data           = false
    enable_lockdown_mode    = false
    zoom                    = false
    preferred_language      = false
    voice_selection         = false
    tv_home_screen_sync     = false
    safety                  = false
    terms_of_address        = false
    express_language        = false
    camera_button           = false
    apple_id                = false
    display_tone            = false
    watch_migration         = false
    update_completed        = false
    appearance              = false
    android                 = false
    payment                 = false
    onboarding              = false
    tos                     = false
    welcome                 = false
    tap_to_setup            = false
    os_showcase             = false
    spoken_language         = false
    multitasking            = false
    safety_and_handling     = false
    keyboard                = false
  }

  location_information {
    username      = ""
    realname      = ""
    phone         = ""
    email         = ""
    room          = ""
    position      = ""
    department_id = "-1"
    building_id   = "-1"
  }

  purchasing_information {
    leased             = false
    purchased          = true
    apple_care_id      = ""
    po_number          = ""
    vendor             = ""
    purchase_price     = ""
    life_expectancy    = 0
    purchasing_account = ""
    purchasing_contact = ""
    lease_date         = "1970-01-01"
    po_date            = "1970-01-01"
    warranty_date      = "1970-01-01"
  }

  names {
    assign_names_using       = "Serial Numbers"
    device_name_prefix       = "ABC-"
    device_name_suffix       = ""
    manage_names             = true
    device_naming_configured = true
  }

  timezone                     = "UTC"
  storage_quota_size_megabytes = 1024
  use_storage_quota_size = false
  
  prestage_minimum_os_target_version_type_ios  = "MINIMUM_OS_SPECIFIC_VERSION"
  minimum_os_specific_version_ios              = "18.4.1"
  prestage_minimum_os_target_version_type_ipad = "NO_ENFORCEMENT"
}

resource "jamfpro_mobile_device_prestage_enrollment" "aviation_mobile_prestage" {
  display_name                            = "Aviation Mobile Prestage"
  mandatory                               = true
  mdm_removable                           = false
  support_phone_number                    = ""
  support_email_address                   = "support@geekygordo.com"
  department                              = ""
  default_prestage                        = false
  enrollment_site_id                      = "-1"
  keep_existing_site_membership           = false
  keep_existing_location_information      = false
  require_authentication                  = false
  authentication_prompt                   = ""
  prevent_activation_lock                 = true
  enable_device_based_activation_lock     = false
  device_enrollment_program_instance_id   = "1"
  enrollment_customization_id             = "0"
  language                                = ""
  region                                  = ""
  auto_advance_setup                      = false
  allow_pairing                           = false
  multi_user                              = false
  supervised                              = true
  maximum_shared_accounts                 = 10
  configure_device_before_setup_assistant = true
  site_id                                 = "-1"
  anchor_certificates                     = []

  skip_setup_items {
    location                = false
    privacy                 = false
    biometric               = false
    software_update         = false
    diagnostics             = false
    imessage_and_facetime   = false
    intelligence            = false
    tv_room                 = false
    passcode                = false
    sim_setup               = false
    screen_time             = false
    restore_completed       = false
    tv_provider_sign_in     = false
    siri                    = false
    restore                 = false
    screen_saver            = false
    home_button_sensitivity = false
    cloud_storage           = false
    action_button           = false
    transfer_data           = false
    enable_lockdown_mode    = false
    zoom                    = false
    preferred_language      = false
    voice_selection         = false
    tv_home_screen_sync     = false
    safety                  = false
    terms_of_address        = false
    express_language        = false
    camera_button           = false
    apple_id                = false
    display_tone            = false
    watch_migration         = false
    update_completed        = false
    appearance              = false
    android                 = false
    payment                 = false
    onboarding              = false
    tos                     = false
    welcome                 = false
    tap_to_setup            = false
    os_showcase             = false
    spoken_language         = false
    multitasking            = false
    safety_and_handling     = false
    keyboard                = false
  }

  location_information {
    username      = ""
    realname      = ""
    phone         = ""
    email         = ""
    room          = ""
    position      = ""
    department_id = "-1"
    building_id   = "-1"
  }

  purchasing_information {
    leased             = false
    purchased          = true
    apple_care_id      = ""
    po_number          = ""
    vendor             = ""
    purchase_price     = ""
    life_expectancy    = 0
    purchasing_account = ""
    purchasing_contact = ""
    lease_date         = "1970-01-01"
    po_date            = "1970-01-01"
    warranty_date      = "1970-01-01"
  }

  names {
    assign_names_using       = "Serial Numbers"
    device_name_prefix       = "[Aviation]-"
    device_name_suffix       = ""
    manage_names             = true
    device_naming_configured = true
  }

  timezone                     = "UTC"
  storage_quota_size_megabytes = 1024
  use_storage_quota_size = false
  
  prestage_minimum_os_target_version_type_ios  = "NO_ENFORCEMENT"
  #minimum_os_specific_version_ios              = "18.4.1"
  prestage_minimum_os_target_version_type_ipad = "NO_ENFORCEMENT"
}