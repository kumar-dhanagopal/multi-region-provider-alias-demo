resource "oci_objectstorage_replication_policy" "replication_policy" {
  depends_on = [
    oci_identity_policy.object_storage_replication,
    oci_objectstorage_bucket.bucket_primary,
    oci_objectstorage_bucket.bucket_standby
  ]
  bucket                              = var.bucket_primary
  destination_bucket_name             = var.bucket_standby
  destination_region_name             = var.region_standby
  name                                = "demo_replication_policy"
  delete_object_in_destination_bucket = "DECLINED"
  namespace                           = var.namespace
}
