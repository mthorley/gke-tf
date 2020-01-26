

/opt/terraform plan -out tf.out
/opt/terraform show -json tf.out > tf.json
mkdir pac/files
mv tf.json pac/files/tf.json
inspec exec pac
