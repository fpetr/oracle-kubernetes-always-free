# Oracle Kubernetes Engine (OKE) Always Free
Terraform configuration for Oracle Kubernetes Engine (OKE) utilizing always-free resources.

## Acknowledgements
> :warning: OKE cluster is provisioned with CSI driver and default storage class. Using any PVC claim will result in additional costs outside of always-free resources. By default every persistent volume is provisioned with minimum capacity of 50 GB.

- By default this configuration provisiones 2 worker nodes with 2 OCPUS and 8 GB of memory each. You can increase memory up to 12 GB per worker node (total 24GB are free). Worker nodes are using VM.Standard.A1.Flex [shape](https://docs.oracle.com/en-us/iaas/Content/Compute/References/computeshapes.htm#vm-standard).

- You are also able to deploy one Load Balancer for free, for example for kubernetes ingress controller.

For more information regarding Oracle always-free resources, please refer to the [official documentation](https://www.oracle.com/cloud/free/)

## Deployment
1. Prepare your terraform variables for OCI provider. You can leave rest of the variables on default values.
2. Deploy infrastructure:
```bash
terraform init
terraform plan
terraform apply
```
3. Terraform will output oci command for creating kubeconfig file.
4. Access you cluster:
```bash
export KUBECONFIG=/path/to/generated/kubeconfig
kubectl get nodes
```

## Cleanup
To cleanup your infrastructure run:
```bash
terraform destroy
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_oci"></a> [oci](#requirement\_oci) | 6.3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_oci"></a> [oci](#provider\_oci) | 6.3.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_oke"></a> [oke](#module\_oke) | oracle-terraform-modules/oke/oci | 5.1.8 |

## Resources

| Name | Type |
|------|------|
| [oci_identity_compartment.oke](https://registry.terraform.io/providers/oracle/oci/6.3.0/docs/resources/identity_compartment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Name of the OKE cluster | `string` | `"oke-free"` | no |
| <a name="input_cluster_type"></a> [cluster\_type](#input\_cluster\_type) | Type of the OKE cluster. Changing to enhanced will result in charges for control plane | `string` | `"basic"` | no |
| <a name="input_kubeconfig_file_path"></a> [kubeconfig\_file\_path](#input\_kubeconfig\_file\_path) | Path where to create kubeconfig file | `string` | `"$HOME/.kube/config"` | no |
| <a name="input_kubernetes_version"></a> [kubernetes\_version](#input\_kubernetes\_version) | Kubernetes version | `string` | `"v1.30.1"` | no |
| <a name="input_region"></a> [region](#input\_region) | OCI region where resources will be created | `string` | `"eu-frankfurt-1"` | no |
| <a name="input_tenancy_ocid"></a> [tenancy\_ocid](#input\_tenancy\_ocid) | Tenancy OCID | `string` | n/a | yes |
| <a name="input_user_ocid"></a> [user\_ocid](#input\_user\_ocid) | User OCID | `string` | n/a | yes |
| <a name="input_user_private_key_fingerprint"></a> [user\_private\_key\_fingerprint](#input\_user\_private\_key\_fingerprint) | Fingerprint of user's key | `string` | n/a | yes |
| <a name="input_user_private_key_path"></a> [user\_private\_key\_path](#input\_user\_private\_key\_path) | Path to user's private key file | `string` | n/a | yes |
| <a name="input_worker_pools"></a> [worker\_pools](#input\_worker\_pools) | Worker nodes configuration | `map(any)` | <pre>{<br>  "oke-vm-standard-ol8": {<br>    "description": "OKE-managed Node Pool with OKE Oracle Linux 8 image",<br>    "memory": 8,<br>    "ocpus": 2,<br>    "os": "Oracle Linux",<br>    "os_version": "8",<br>    "shape": "VM.Standard.A1.Flex",<br>    "size": 2<br>  }<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_access_command"></a> [cluster\_access\_command](#output\_cluster\_access\_command) | OCI command for creting kubeconfig file |
