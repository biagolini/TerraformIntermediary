terraform { #Você não pode usar variáveis dentro do bloco terraform{} porque esse é o “bloco raiz/core” do seu projeto. Será o primeiro bloco de código a ser rodado, logo não pode conter variáveis ou interpolação dentro dele.  
  required_version = "1.2.9"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.29.0"
    }
  }

  backend "s3" {
    bucket = "nome_bucket"
    key    = "dev/terraform"
    region = "us-east-1"
  }
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}
