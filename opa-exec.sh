

/opt/terraform plan -out tf.binary
/opt/terraform show -json tf.binary > tfplan.json
./opa eval --format pretty --data terraform.rego --input tfplan.json "data.terraform.assurance.gke.authz"

