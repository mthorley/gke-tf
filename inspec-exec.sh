

/opt/terraform plan -out tf.out
/opt/terraform show -json tf.out > tf.json
mv tf.json pac/files
inspec exec pac
