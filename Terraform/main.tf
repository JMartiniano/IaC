# O primeiro bloco é o terraform, usado para configurar a plataforma de cloud que será usada, assim como sua região e a imagem da máquina virtual que será criada. Essa imagem é o valor passado à variável ami no subloco resource.

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 1.0.10"
}

provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

resource "aws_instance" "app_server" {
  # Aqui foi alterada a imagem da VM para ser uma escolhida por mim
  ami           = "ami-036d46416a34a611c" 
  # Esse tipo de instância é a gratuita pode 12 meses usando 750h por mês
  instance_type = "t2.micro" 
  # Passando o arquivo com o par de chaves SSH
  key_name = "PrimeiraInstancia" 
  ##Inciando o bloco de comandos bash
  #
  #user_data = <<-EOF
  #            #!/bin/bash
  #            cd /home/ubuntu
  #            echo "<h1>Sou euuuuuu, o tiririiiiiica!</h1>" >> index
  #            nohup busybox httpd -f -p 8080 &
  #            EOF
  ##

  tags = {
    Name = "Primeira instancia" # Aqui damos o nome da máquina virtual, que na AWS é chamada de Instância
  }
}