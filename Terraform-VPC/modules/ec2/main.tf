resource "aws_instance" "web" {
  count                  = length(var.subnet_ids)
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_ids[count.index]
  vpc_security_group_ids = [var.security_group_id]

  tags = {
    Name = "web-server-${count.index + 1}"
  }
}
