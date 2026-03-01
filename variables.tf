variable "bucket_name" {
  description = "Globally-unique S3 bucket name"
  type        = string
}

variable "versioning" {
  description = "Enable S3 bucket versioning"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Additional tags"
  type        = map(string)
  default     = {}
}