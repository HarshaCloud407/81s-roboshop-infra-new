variable "project_name" {
    default = "roboshop"
}

variable "environment" {
    default = "dev"
}

variable "common_tags" {
    default = {
        Project = "roboshop"
        Terraform = "true"
        Environment = "dev"
    }
}


variable "zone_name" {
<<<<<<< HEAD
    default = "hariawsdevops.online"
}

variable "zone_id" {
    default = "Z00916842MCDX0S5FWPWY"
=======
    default = "daws81s.online"
}

variable "zone_id" {
    default = "Z09912121MS725XSKH1TG"
>>>>>>> 3125dce2369c948575274853b3ccaf8d5ad51485
}
