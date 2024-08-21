output "cluster_access_command" {
  value = "oci ce cluster create-kubeconfig --cluster-id ${module.oke.cluster_id} --file ${var.kubeconfig_file_path} --region ${var.region} --token-version 2.0.0  --kube-endpoint PUBLIC_ENDPOINT"
}