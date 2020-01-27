
// output variables used by inspec 

output "gke_enable_legacy_abac" {
  value = google_container_cluster.cluster.enable_legacy_abac
}

output "gke_location" {
  value = google_container_cluster.cluster.location
}

output "gke_logging" {
  value = google_container_cluster.cluster.logging_service
}

output "gke_monitoring" {
  value = google_container_cluster.cluster.monitoring_service
}

output "gke_master_username" {
  value = google_container_cluster.cluster.master_auth[0].username
}

output "gke_master_password" {
  value = google_container_cluster.cluster.master_auth[0].password
}

output "gke_issue_client_cert" {
  value = google_container_cluster.cluster.master_auth[0].client_certificate_config[0].issue_client_certificate
}

output "gke_network_policy" {
  value = google_container_cluster.cluster.network_policy[0].enabled
}

output "gke_network_policy_config" {
  value = google_container_cluster.cluster.addons_config[0].network_policy_config[0].disabled
}

output "gke_private_endpoint" {
  value = google_container_cluster.cluster.private_cluster_config[0].enable_private_endpoint
}

output "gke_private_nodes" {
  value = google_container_cluster.cluster.private_cluster_config[0].enable_private_nodes
}

output "gke_master_cidr_block" {
  value = google_container_cluster.cluster.private_cluster_config[0].master_ipv4_cidr_block
}

// assuming multiple node pools 
output "nps_locations" {
  value = [ google_container_node_pool.private-np-1.location, 
            google_container_node_pool.private-np-1.location]
}

output "nps_oauthscopes" {
  value = [ google_container_node_pool.private-np-1.node_config[0].oauth_scopes ,
            google_container_node_pool.private-np-1.node_config[0].oauth_scopes ]
}