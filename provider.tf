provider "oci" {
  alias            = "primary_region"
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_file
  region           = var.primary_region
}

provider "oci" {
  alias            = "standby_region"
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_file
  region           = var.standby_region
}