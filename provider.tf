terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "6.3.0"
    }
  }
}

provider "oci" {
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  private_key_path = var.user_private_key_path
  fingerprint      = var.user_private_key_fingerprint
  region           = var.region
}
