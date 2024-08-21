variable "region" {
  description = "OCI region where resources will be created"
  type        = string
  default     = "eu-frankfurt-1"
}

variable "tenancy_ocid" {
  description = "Tenancy OCID"
  type        = string
}

variable "user_ocid" {
  description = "User OCID"
  type        = string
}

variable "user_private_key_path" {
  description = "Path to user's private key file"
  type        = string
}

variable "user_private_key_fingerprint" {
  description = "Fingerprint of user's key"
  type        = string
}

variable "cluster_name" {
  description = "Name of the OKE cluster"
  type        = string
  default     = "oke-free"
}

variable "cluster_type" {
  description = "Type of the OKE cluster. Changing to enhanced will result in charges for control plane"
  type        = string
  default     = "basic"
}

variable "kubernetes_version" {
  description = "Kubernetes version"
  type        = string
  default     = "v1.30.1"
}

variable "kubeconfig_file_path" {
  description = "Path where to create kubeconfig file"
  type        = string
  default     = "$HOME/.kube/config"
}

variable "worker_pools" {
  description = "Worker nodes configuration"
  type        = map(any)
  default = {
    oke-vm-standard-ol8 = {
      description = "OKE-managed Node Pool with OKE Oracle Linux 8 image",
      size        = 3,
      os          = "Oracle Linux",
      os_version  = "8",
      shape       = "VM.Standard.A1.Flex",
      ocpus       = 1,
      memory      = 6,
    },
  }
}