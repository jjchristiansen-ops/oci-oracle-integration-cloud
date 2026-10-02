aresource "oci_integration_integration_instance" "my_oic_instance" {
  # Required Configuration
  compartment_id            = var.compartment_ocid
  display_name              = "Production-OIC-Instance"
  integration_instance_type = "ENTERPRISEX" # Defines Oracle Integration 3 Enterprise
  message_packs             = 1
  is_byol                   = false # Set to true if bringing your own Oracle license

  # Optional Network & Feature Toggles
  is_file_server_enabled       = true
  is_disaster_recovery_enabled = false

  # Optional Endpoint Whitelisting
  network_endpoint_type = "PUBLIC"
  /* 
  allowlisted_ips = [
    "192.168.1.0/24",
    "10.20.30.0/26"
  ]
  */

  defined_tags = {
    "Operations.Environment" = "Production"
  }
}

output "oic_design_time_url" {
  value       = oci_integration_integration_instance.my_oic_instance.instance_design_time_url
  description = "The URL used to design integrations in the OIC console."
}