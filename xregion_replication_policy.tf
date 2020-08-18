resource "time_sleep" "wait" {
  depends_on = [
    oci_identity_policy.object_storage_replication,
    oci_objectstorage_bucket.bucket_primary,
    oci_objectstorage_bucket.bucket_standby
  ]
  create_duration = var.wait_before_creating_xregion_replication_policy
}
resource "oci_objectstorage_replication_policy" "replication_policy" {
  depends_on                          = [time_sleep.wait]
  bucket                              = var.bucket_primary
  destination_bucket_name             = var.bucket_standby
  destination_region_name             = var.region_standby
  name                                = "demo_replication_policy"
  delete_object_in_destination_bucket = "ACCEPT"
  namespace                           = var.namespace
}