output "ubuntu_ami_resolute" {
    type = object({
      id = string
      name = string
    })

    value = {
      id = data.aws_ami.ami_ubuntu_resolute.id
      name = data.aws_ami.ami_ubuntu_resolute.name
    }
}