## tailstack

[![Gem Version](https://badge.fury.io/rb/tailstack.svg)](https://badge.fury.io/rb/tailstack)

Used along with `aws cli`, which launches a CloudFormation stack, then after run `tailstack` to follow along with the color coded event output that matches the AWS web console.

### Installation

`gem install tailstack`

### Authentication

AWS credentials that have permission to describe CloudFormation stacks can be provided either by:

* setting shell environment variables `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`
* using an AWS configuration credentials file in ~/.aws/credentials

AWS Region can be set using:

* `--region` argument option
* in ~/.aws/config for the `--profile` for which you're launching

### Common Usage
A `Makefile` that contains create, update, delete targets allows an easy way to run `tailstack` after configuring and launching a stack change.

~~~~
REGION=us-west-2
APP=appname
ENV=prod
RESORCE_SET=ec2-instance

STACK_JSON=${APP}-${RESOURCE_SET}.json
STACK_NAME=${APP}-${ENV}-${RESORCE_SET}
STACK_PARM=${STACK_JSON}
_create:
	aws cloudformation create-stack --region ${REGION} --stack-name ${STACK_NAME} \
		--template-body file://${STACK_JSON} --parameters file://parmsets/${ENV}/${STACK_PARM} \
		--capabilities CAPABILITY_IAM
_delete:
	aws cloudformation delete-stack --region ${REGION} --stack-name ${STACK_NAME}
_update:
	aws cloudformation update-stack --region ${REGION} --stack-name ${STACK_NAME} \
	--parameters file://parmsets/${ENV}/${STACK_PARM} --template-body file://${STACK_JSON} \
	--capabilities CAPABILITY_IAM
test:
	aws cloudformation validate-template --template-body file://${STACK_JSON}
status:
	@tailstack --region ${REGION} --stack ${STACK_NAME}
list:
	@tailstack --region ${REGION} --list --outputs --parms

~~~~

Create `parmsets/prod/appname-ec2-instance.json` which includes an array list of `ParameterKey`/`ParameterValue` hashes for your parameter values. Now with that `Makefile` in place launching and monitoring the output of CloudFormation template `appname-ec2-instance.json` as stack name `appname-prod-ec2-instance` run:

```
make create
```

If the stack creation is successful it'll return with a value of 0, otherwise a non 0 value will be returned.
