# Locust

aws cloudformation create-stack --stack-name locust-master --template-body file://locust-master.yaml --parameters file://master-parameter.json --capabilities CAPABILITY_NAMED_IAM

aws cloudformation create-stack --stack-name locust-worker --template-body file://locust-worker.yaml --parameters file://worker-parameter.json --capabilities CAPABILITY_NAMED_IAM
