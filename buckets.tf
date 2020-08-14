resource "oci_objectstorage_bucket" "bucket_primary" {
  provider = oci.primary_region
  compartment_id = var.compartment_id
  name           = var.bucket_primary
  namespace      = var.namespace
}

resource "oci_objectstorage_bucket" "bucket_standby" {
  provider = oci.standby_region
  compartment_id = var.compartment_id
  name           = var.bucket_standby
  namespace      = var.namespace
}