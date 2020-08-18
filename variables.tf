variable "tenancy" {}
variable "user" {}
variable "fingerprint" {}
variable "private_key" {}
variable "region_primary" {}
variable "region_standby" {}
variable "compartment" {}
variable "namespace" {}
variable "bucket_primary" {}
variable "bucket_standby" {}
variable "wait_before_creating_xregion_replication_policy" {
    default = "15s"
}