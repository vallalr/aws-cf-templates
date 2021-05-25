aws cloudformation create-stack --stack-name boundary-controller-0 --template-body file://al2-mutable-public.yaml --parameters file://boundary-controller-0-parameter.json --capabilities CAPABILITY_NAMED_IAM


aws cloudformation create-stack --stack-name boundary-controller-1 --template-body file://al2-mutable-public.yaml --parameters file://boundary-controller-1-parameter.json --capabilities CAPABILITY_NAMED_IAM


aws cloudformation create-stack --stack-name boundary-controller-2 --template-body file://al2-mutable-public.yaml --parameters file://boundary-controller-2-parameter.json --capabilities CAPABILITY_NAMED_IAM


aws cloudformation create-stack --stack-name boundary-worker-0 --template-body file://al2-mutable-public.yaml --parameters file://boundary-worker-0-parameter.json --capabilities CAPABILITY_NAMED_IAM


aws cloudformation create-stack --stack-name boundary-worker-1 --template-body file://al2-mutable-public.yaml --parameters file://boundary-worker-1-parameter.json --capabilities CAPABILITY_NAMED_IAM


aws cloudformation create-stack --stack-name boundary-worker-2 --template-body file://al2-mutable-public.yaml --parameters file://boundary-worker-2-parameter.json --capabilities CAPABILITY_NAMED_IAM

