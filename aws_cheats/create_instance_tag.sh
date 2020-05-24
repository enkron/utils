#!/bin/bash

printf "in order to give a name to the instance you should know instance id:\n"
printf "aws --region <region_name> ec2 describe-instances --query "
printf "\"Reservations[].Instances[].InstanceId\"\n\n"

printf "tag creation command:\n"
printf "aws --region <region_name> ec2 create-tags"
printf " --resources i-0419afa67c253ec62"
printf " --tags Key=Name,Value=<inst_name>\n\n"
=======
printf "aws --region <region_name>  ec2 create-tags"
printf " --resources i-0419afa67c253ec62"
printf " --tags Key=Name,Value=<inst_name>\n\n"

printf "list of regoins codes:\n
[Code] 	         [Name]                     [Opt-in Status]
us-east-1        US East (N. Virginia)      Not required
us-east-2        US East (Ohio)             Not required
us-west-1        US West (N. California)    Not required
us-west-2        US West (Oregon)           Not required
ca-central-1     Canada (Central)           Not required
eu-central-1     EU (Frankfurt)             Not required
eu-west-1        EU (Ireland)               Not required
eu-west-2        EU (London)                Not required
eu-west-3        EU (Paris)                 Not required
eu-north-1       EU (Stockholm)             Not required
ap-east-1        Asia Pacific (Hong Kong)   Required
ap-northeast-1   Asia Pacific (Tokyo)       Not required 
ap-northeast-2   Asia Pacific (Seoul)       Not required 
ap-northeast-3   Asia Pacific (Osaka-Local) Not required
ap-southeast-1   Asia Pacific (Singapore)   Not required
ap-southeast-2   Asia Pacific (Sydney)      Not required
ap-south-1       Asia Pacific (Mumbai)      Not required
me-south-1       Middle East (Bahrain)      Required
sa-east-1        South America (São Paulo)  Not required\n"
