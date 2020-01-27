# encoding: utf-8
# copyright: 2020 Matt Thorley

title 'GKE Terraform Unit Tests'

# verify format of terraform 
control 'PL.TF.C-01' do 
  impact 1.0
  title 'Confirm terraform format version'
  desc 'Terraform json format version supported is 0.1'
  describe gke_config do
    its('version') { should eq '0.1' }
  end
end  

control 'PL.GKE.C-31' do
  impact 1.0
  tag "CIS GKE 6.6.7"
  title 'Network policy must be enabled'
  desc 'Network policy must be enabled to control pod to pod communication.'
  describe gke_config do
    it { should have_network_policy_enabled }
  end
  describe gke_config do
    it { should_not have_network_policy_config_disabled }
  end
end

control 'PL.GKE.C-53' do
  impact 1.0
  tag "CIS GKE 6.6.4"
  title 'Ensure private nodes and private control plane access only'
  desc 'Cluster must be have private endpoints, nodes and a specified master cidr.'
  describe gke_config do
    it { should have_a_private_endpoint }
  end
  describe gke_config do
    it { should have_private_nodes }
  end
  describe gke_config do
    its('master_cidr_block') { should_not be_empty }
  end
end

control 'PL.GKE.C-54' do
  impact 1.0
  title 'Region containment to AU'
  desc 'Region for the cluster and all associated node pools must be AU based.'
  region = 'australia-southeast1'

  describe gke_config do 
    its('cluster_location') { should eq region}
  end
  
  describe gke_config do
    its('nps_locations') { should all( match(region) ) }
  end
end

control 'PL.GKE.C-55' do
  impact 1.0
  tag "CIS GKE 1.2.2"
  title 'GKE master basic authentication must be disabled and client cert must not be issued'
  desc 'GKE master basic authentication username and password must be disabled and client cert must not be issued.'
  describe gke_config do
    its('master_username') { should eq '' }
  end
  describe gke_config do
    its('master_password') { should eq '' }
  end
  describe gke_config do
    it { should_not have_issued_client_cert }
  end
end

control 'PL.GKE.C-61' do 
  impact 1.0
  tag "CIS GKE 6.8.4"
  title 'Legacy ABAC disabled'
  desc 'Legacy ABAC is deprecated and must not be enabled - instead use RBAC.'
  describe gke_config do
    it { should_not have_legacy_abac_enabled }
  end
end

control 'PL.GKE.C-65' do
  impact 1.0
  tag "CIS GKE 6.7.1"
  title 'GKE logging and monitoring must be enabled'
  desc 'GKE logging and monitoring must be enabled.'
  describe gke_config do 
    its('logging_service') { should eq 'logging.googleapis.com/kubernetes' }
  end
  describe gke_config do 
    its('monitoring_service') { should eq 'monitoring.googleapis.com/kubernetes' }
  end
end

control 'PL.GKE.C-10' do
  impact 1.0
  tag "CIS GKE XXX"
  title 'Ensure node pool oauthscopes are least privilege'
  desc 'Ensure node pool oauthscopes are least privilege'

#  describe gke_config do 
#    nps = gke_config.nps_oauthscopes
#    nps.each do |scopes|
#      it { scopes should eq "test" }  
#    end 
#  end
end