#!/bin/bash

printf "choose the region:\n"
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
sa-east-1        South America (São Paulo)  Not required\n\n"

printf "enter region code: "
read region

printf "choose ami type:\n" 
printf "available types:\n" 
printf "
         [Code]  [Name]
          0      Linux 2 AMI 
          1      Linux AMI
          2      Ubuntu Server 16.04 LTS AMI
          3      Red Hat Enterprise Linux 7.5 AMI
          4      SUSE Linux Enterprise Server 15 AMI\n\n"

printf "enter ami code: "
read ami

if [ $ami = "0" ]; then
    aws --region $region ec2 describe-images \
        --owners amazon \
        --filters 'Name=name,Values=amzn2-ami-hvm-2.0.????????.?-x86_64-gp2' 'Name=state,Values=available' \
        --query 'reverse(sort_by(Images, &CreationDate))[:1].ImageId' \
        --output text
fi
if [ $ami = "1" ]; then
    aws --region $region ec2 describe-images \
        --owners amazon \
        --filters 'Name=name,Values=amzn-ami-hvm-????.??.?.????????-x86_64-gp2' 'Name=state,Values=available' \
        --query 'reverse(sort_by(Images, &CreationDate))[:1].ImageId' \
        --output text
fi
if [ $ami = "2" ]; then
    aws --region $region ec2 describe-images \
        --owners 099720109477 \
        --filters 'Name=name,Values=ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-????????' 'Name=state,Values=available' \
        --query 'reverse(sort_by(Images, &CreationDate))[:1].ImageId' \
        --output text
fi
if [ $ami = "3" ]; then
    aws --region $region ec2 describe-images \
        --owners 309956199498 \
        --filters 'Name=name,Values=RHEL-7.5_HVM_GA*' 'Name=state,Values=available' \
        --query 'reverse(sort_by(Images, &CreationDate))[:1].ImageId' \
        --output text
fi
if [ $ami = "4" ]; then
    aws --region $region ec2 describe-images \
        --owners amazon \
        --filters 'Name=name,Values=suse-sles-15-v????????-hvm-ssd-x86_64' 'Name=state,Values=available' \
        --query 'reverse(sort_by(Images, &CreationDate))[:1].ImageId' \
        --output text
fi
