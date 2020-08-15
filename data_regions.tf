data "oci_identity_tenancy" "tenancy_details" {
    tenancy_id = var.tenancy_ocid
}
