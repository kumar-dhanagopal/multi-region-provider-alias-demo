data "oci_identity_policies" "policies" {
provider = oci.primary_region
    compartment_id = var.compartment
}
data "oci_identity_policies" "policies" {
provider = oci.standby_region
    compartment_id = var.compartment
}
