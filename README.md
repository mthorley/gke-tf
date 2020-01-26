# gke-tf

Inspec used to verify the tfstate from Terraform GKE resource to ensure it is security hardened and compliant.

Note this is unit testing and is executed post plan but before apply.

## Run
To run use ```./inspec-exec.sh``` This generates a json output of the plan and includes specific output variables that are used by inspec to verify the configuration.