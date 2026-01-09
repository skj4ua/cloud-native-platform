resource "aws_security_group" "devops_sg"{
    name = "devops-sg"
    description ="Allow ssh and http"

ingress{
    description="SSH"
    from_port=22
    to_port=22
    protocol="tcp"
    cidr_blocks = ["0.0.0.0/0"]
}


ingress{
    description="HTTP"
    from_port=80
    to_port=80
    protocol="tcp"
    cidr_blocks=["0.0.0.0/0"]
}

egress{
    from_port=0
    to_port=0
    protocol="-1"
    cidr_blocks=["0.0.0.0/0"]
}
}

resource "aws_instance" "devops_ec2"{
    ami="ami-0ced6a024bb18ff2e" # Amazon linux 2 (ap-south-1)
    instance_type=var.instance_type
    key_name=var.key_name
    vpc_security_group_ids=[aws_security_group.devops_sg.id]

    tags={
        Name="devops-terraform-ec2"
    }
}

