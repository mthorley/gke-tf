
class GKETerraformConfig < Inspec.resource(1)
    name "gke_config"

    desc "
      GKE terraform config to enable pre deployment tests.
      It is key that the terraform outputs.tf define variables used in this class 
      e.g. 
      output 'gke_enable_legacy_abac' {
        value = google_container_cluster.cluster.enable_legacy_abac
      }
    "

    example "
      describe gke_config do
        its('location') { should eq 'australia-southeast1'}
      end
    "

    def initialize
      # load data from Terraform output
      content = inspec.profile.file("tf.json")
      @doc = JSON.parse(content)
      @outputs = @doc['planned_values']['outputs']
    end

    def version
      @doc['format_version']
    end

    def has_legacy_abac_enabled?
      @outputs['gke_enable_legacy_abac']['value']
    end

    def location
      @outputs['gke_location']['value']
    end

    def logging_service 
      @outputs['gke_logging']['value']      
    end

    def monitoring_service 
      @outputs['gke_monitoring']['value']      
    end

    def master_username
      @outputs['gke_master_username']['value']
    end
    
    def master_password
      @outputs['gke_master_password']['value']
    end

    def has_issued_client_cert?
      @outputs['gke_issue_client_cert']['value']
    end

    def has_network_policy_enabled?
      @outputs['gke_network_policy']['value']
    end

    def has_network_policy_config_disabled?
      @outputs['gke_network_policy_config']['value']
    end

    def has_a_private_endpoint?
      @outputs['gke_private_endpoint']['value']
    end

    def has_private_nodes?
      @outputs['gke_private_nodes']['value']
    end

    def master_cidr_block
      @outputs['gke_master_cidr_block']['value']
    end
  
  end