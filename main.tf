
 resource "aws_vpc" "mtc_vpc" {
    cidr_block = "172.31.0.0/16"
    enable_dns_hostnames = true
    enable_dns_support = true

    tags = {
        name = "dev"
    }
}

resource "aws_subnet" "mtc_public_subnet" {
    vpc_id = aws_vpc.mtc_vpc.id   
    cidr_block = "172.31.1.0/24"
    map_public_ip_on_launch = true
    availability_zone = "us-west-2a"

    tags = {
        name = "dev-public"
    }
}

resource "aws_internet_gateway" "mtc_internet_gateway" {
    vpc_id = aws_vpc.mtc_vpc.id

    tags = {
      name = "dev-igw"
    }
}

resource "aws_route_table" "mtc_public_rt" {
    vpc_id = aws_vpc.mtc_vpc.id
  
    tags = {
        name = "dev_public_rt"
    }  
}

resource "aws_route" "default_route" {
    route_table_id = aws_route_table.mtc_public_rt
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.mtc_internet_gateway.id
}

resource "aws_route_table_association" "mtc_public_assoc" {
    subnet_id = aws_subnet.mtc_public_subnet.id
    route_table_id = aws_route_table.mtc_public_rt.id
}

resource "aws_security_group" "mtc_sg" {
    name = "dev_sg"
    description = "dev security group"
    vpc_id = aws_vpc.mtc_vpc.id

    ingress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0 
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_key_pair" "mtc_auth" {
    key_name = "mtckey"
    public_key = file("~/.ssh/mtckey.pub")
  
}

resource "aws_instance" "dev_node" {
    instance_type = "t2.micro"
    ami = data.aws_ami.server_ami.id
    key_name = aws_key_pair.mtc_auth.id
    vpc_security_group_ids = [aws_security_group.mtc_sg.id]
    subnet_id = aws_subnet.mtc_public_subnet.id


    root_block_device {
        volume_size = 10
    }

    tags = {
        Name = "dev-node"
    }


    provisioner "local.exec" {
        command = templatefile("windiows-ssh-config.tpl",{
            hostname = self.public_ip,
            user = "ubuntu",
         identityfile = "~/.ssh/mtckey"
        })
        interpreter = var.host_os == "windows" ? ["Powershell","Command"] : ["bash","-c"]
  }
}
