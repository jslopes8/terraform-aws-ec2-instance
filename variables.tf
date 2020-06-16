variable "instance_count" {
    type    = number
    default = 1
}
variable "name" {
    type    = string
}
variable "ami" {
    type    = string
}
variable "availability_zone" {
    type    = list
    default = []
}
variable "instance_type" {
    type    = string
}
variable "ebs_optimized" {
    type    = bool
    default = false
}
variable "monitoring" {
    type    = bool
    default = true
}
variable "iam_instance_profile" {
    type    = string
    default = ""
}
variable "key_name" {
    type    = string
}
variable "subnet_id" {
    type    = list(string)
}
variable "vpc_security_group_ids" {
    type    = list(string)
    default = []
}
variable "associate_public_ip_address" {
    type    = bool
    default = false
}
variable "source_dest_check" {
    type    = bool
    default = true
}
variable "disable_api_termination" {
    type    = bool
    default = false
}
variable "user_data" {
    type    = string
    default = ""
}
variable "root_block_device" {
    type    = list(map(string))
}
variable "ebs_block_device" {
    type    = list(map(string))
    default = []
}
variable "ephemeral_block_device" {
    type    = list(map(string))
    default = []
}
variable "default_tags" {
    type    = map(string)
    default = {}
}
variable "use_num_suffix" {
    type        = bool
    default     = false
}
