#------------------------------------------------------------------------------
# Required Variables
#------------------------------------------------------------------------------
variable "aws_region" {
  description = "The AWS region to deploy to (ex. us-east-2)"
  type        = string
  default     = "us-east-2"
}

variable "tf_project" {
  description = "The environment being invoked."
  type        = string
}
