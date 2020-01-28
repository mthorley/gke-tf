# gke-tf

Comparison of Inspec and OPA used to verify the tfstate from Terraform GKE resource to ensure it is security hardened and compliant.

Note this is unit testing and is executed post plan but before apply.

Further work will be applied to use https://github.com/instrumenta/conftest with OPA.

## Run
For Inspec, use ```./inspec-exec.sh``` This generates a json output of the plan and includes specific output variables that are used by inspec to verify the configuration.

For OPA, use ```./opa-exec.sh```.

