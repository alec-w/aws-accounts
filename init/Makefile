PYTHON=python3

lint:
	$(PYTHON) -m venv .venv
	./.venv/bin/pip install cfn-lint==1.20.0
	./.venv/bin/cfn-lint terraform-root-stack.yaml
	rm -rf ./.venv

deploy:
	aws cloudformation deploy --template-file terraform-root-stack.yaml --stack-name terraform-root

outputs:
	aws cloudformation describe-stacks --query 'Stacks[?StackName==`terraform-root`].Outputs' | jq '.[0] | {"bucket":.[]|select(.OutputKey=="BucketName").OutputValue,"table":.[]|select(.OutputKey=="TableName").OutputValue}'
