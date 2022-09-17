
# Qual é o nome da conta que está acessando a AWS"
data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "remote-state" {
  # O nome do Bucket será uma concatenação de:
  # string "tfstate" + id da sua conta 
  bucket = "tfstate-${data.aws_caller_identity.current.account_id}"

  # Você deve habilitar o versionamneto para permitir recuperar estados passados da sua instância
  versioning {
    enabled = true
  }

  tags = {
    Description = "Remote State Bucket"
    ManagedBy   = "Terraform"
    Owner       = "Seu Nome"
    CreatedAt   = "2022-09-16"
  }
}

output "remote_state_bucket" {
  value = aws_s3_bucket.remote-state.bucket
}

output "remote_state_bucket_arn" {
  value = aws_s3_bucket.remote-state.arn
}
