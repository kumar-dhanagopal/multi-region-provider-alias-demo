provider "oci" {
  alias            = "primary_region"
  tenancy_ocid     = var.tenancy
  user_ocid        = var.user
  fingerprint      = var.fingerprint
  private_key_path = var.private_key
  region           = var.region_primary
}

provider "oci" {
  alias            = "standby_region"
  tenancy_ocid     = var.tenancy
  user_ocid        = var.user
  fingerprint      = var.fingerprint
  private_key_path = var.private_key
  region           = var.region_standby
}