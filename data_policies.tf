data "oci_identity_policies" "policies_primary_region" {
provider = oci.primary_region
    compartment_id = var.compartment
}
data "oci_identity_policies" "policies_standby_region" {
provider = oci.standby_region
    compartment_id = var.compartment
}
