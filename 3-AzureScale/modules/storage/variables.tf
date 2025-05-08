variable "resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
}

variable "location" {
  description = "Azure location for the resources"
  type        = string
}

variable "blob_local_path" {
  description = "The path to the blob to be uploaded"
  type        = string
}