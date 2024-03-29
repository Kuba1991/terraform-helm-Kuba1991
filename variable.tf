variable app_name {
  type        = string
  default     = ""
  description = "the helm chart app name"
}


variable namespace {
 type = string
 default = ""
 description = "the name in which the resource will be deployed"
}

variable podlimit {
  type = number
  default = 10
  description = " the max number of pod on a namespace"
}

variable cpu_max {
}

variable mem_max {
    
}