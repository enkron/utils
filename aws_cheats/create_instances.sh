#!/bin/bash

aws --region eu-central-1 ec2 run-instances \
    --image-id ami-00aa4671cbf840d82 \
    --count 1 \
    --instance-type t2.micro \
    --key-name rgn-ccdd-access-6-8 \
    --security-group-ids sg-086aac43c92b7edc5 \
    --subnet-id subnet-0b27003826e0366ae

"[Code] 	        [Name] 	               [Opt-in Status]
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
sa-east-1        South America (São Paulo)  Not required"
