locals {
    # # Deprecated
    # default_tags = map(  
    # "Name", "TF-Learning",
    # "Env", "Prod"
    #  )

    default_tags = {
    Name = "TF-Learning",
    Env = "Prod"
    # Department = "IT"
    }
}

# EC2
module "ec2-test" {
    source = ".//ec2-module"
    name = "instance-01" 
    instance_type = "t2.micro" 
    vol_size = 90
  
} 

# EBS
resource "aws_ebs_volume" "tf_learning_ebs" {
  availability_zone = "us-east-1a"
  size              = 60
  tags = merge(local.default_tags)

  # lifecycle {
  #   ignore_changes = [size]
  # }
}
