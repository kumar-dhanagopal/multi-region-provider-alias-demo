resource "oci_identity_policy" "object_storage_replication" {
  provider       = oci.home_region
  compartment_id = var.compartment
  description    = "Policy to permit the Object Storage service in the primary region to replicate objects to the standby region"
  name           = "iam_object_storage_policy"
  statements     = ["Allow service objectstorage-${var.region_primary} to manage object-family in compartment id ${var.compartment}"]
}