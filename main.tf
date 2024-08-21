resource "oci_identity_compartment" "oke" {
  compartment_id = var.tenancy_ocid
  description    = "Compartment for OKE cluster resources"
  name           = var.cluster_name
  enable_delete  = true
}

module "oke" {
  source    = "oracle-terraform-modules/oke/oci"
  version   = "5.1.8"
  providers = { oci.home = oci }

  tenancy_id     = var.tenancy_ocid
  compartment_id = oci_identity_compartment.oke.id

  cluster_name       = var.cluster_name
  cluster_type       = var.cluster_type
  kubernetes_version = var.kubernetes_version

  assign_public_ip_to_control_plane = true
  control_plane_is_public           = true
  control_plane_allowed_cidrs       = ["0.0.0.0/0"]

  create_bastion  = false
  create_operator = false
  create_drg      = false
  create_vcn      = true

  vcn_name = var.cluster_name

  worker_pools = var.worker_pools
}