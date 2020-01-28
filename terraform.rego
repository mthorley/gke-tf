package terraform.assurance.gke

import input as tfplan

default authz = false

authz {
  control_pl_gke_c_31
  control_pl_gke_c_53
  control_pl_gke_c_54
}

CIDR_REGEX = `^([0-9]{1,3}\.){3}[0-9]{1,3}(\/([0-9]|[1-2][0-9]|3[0-2]))?$`
AU_REGION = "australia-southeast1" 

base_path = tfplan.planned_values.outputs

#  @control 'PL.GKE.C-31'
#  @impact 1.0
#  @tag "CIS GKE 6.6.7"
#  @title 'Network policy must be enabled'
#  @desc 'Network policy must be enabled to control pod to pod communication.'
control_pl_gke_c_31 {
  network_policy_enabled
  not network_policy_config_disabled  
}

network_policy_enabled {
  base_path.gke_network_policy.value
}

network_policy_config_disabled {
  base_path.gke_network_policy_config.value
}

# @control 'PL.GKE.C-53' do
# @impact 1.0
# @tag "CIS GKE 6.6.4"
# @title 'Ensure private nodes and private control plane access only'
# @desc 'Cluster must be have private endpoints, nodes and a specified master cidr.'
control_pl_gke_c_53 {
  private_endpoint_enabled
  private_nodes_enabled
  master_cidr_block_defined
}
 
private_endpoint_enabled {
  base_path.gke_private_endpoint.value
} 

private_nodes_enabled {
  base_path.gke_private_nodes.value
}

master_cidr_block_defined {
  re_match(CIDR_REGEX, 
    base_path.gke_master_cidr_block.value)
}

# @control 'PL.GKE.C-54' do
# @impact 1.0
# @title 'Region containment to AU'
# @desc 'Region for the cluster and all associated node pools must be AU based.'
control_pl_gke_c_54 {
  au_cluster_location
  au_nodepool_locations
}

au_cluster_location {
  base_path.gke_location.value == AU_REGION
}

au_nodepool_locations = all {
  all := [ loc | 
    loc:= base_path.nps_locations[_]
    loc == AU_REGION
  ]
}
