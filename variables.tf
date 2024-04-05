variable "region" {
  description = "aws region"
  type        = string
  default     = "eu-west-1"
}

variable "key_name" {
  type    = string
  default = "Jenkins-serverKP"

}


variable "vpc_cidr" {
  type = string
  default = "10.0.0.0/16"
  
}
