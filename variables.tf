# Variáveis
variable "aws_region" {
  type        = string
  description = "Default region"
  default     = "us-east-1"
}

variable "aws_profile" {
  type        = string
  description = ""
  default     = "terraformKey"
}

variable "environment" {
  type        = string
  description = ""
  default     = "dev"
}
