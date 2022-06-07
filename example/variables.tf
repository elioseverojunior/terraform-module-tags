variable "application" {
  description = "Application Name"
  type        = string
}

variable "runtime" {
  description = "Runtime Name. Which runtime owns the resource? This is used for cost analysis and support."
  type        = string
  validation {
    condition = anytrue([
      var.runtime == "snd",
      var.runtime == "dev",
      var.runtime == "sit",
      var.runtime == "pre",
      var.runtime == "prd",
      var.runtime == "nickel",
      var.runtime == "bronze",
      var.runtime == "silver",
      var.runtime == "gold",
      var.runtime == "platinum",
      var.runtime == "bronze-data",
      var.runtime == "silver-data",
      var.runtime == "gold-data",
    ])
    error_message = "Must have a valid runtime, can be snd, dev, sit, pre, prd, nickel, bronze, silver, gold, platinum, bronze-data, silver-data, gold-data."
  }
}

variable "country" {
  description = "Country Name. Which country owns the resource? This is used for cost analysis and support."
  type        = string
  validation {
    condition = anytrue([
      var.country == "us" || var.country == "US",
      var.country == "br" || var.country == "BR",
      var.country == "au" || var.country == "AU",
    ])
    error_message = "Must have a valid country code, can be us|US, br|BR, au|AU."
  }
}

variable "business_owner" {
  description = "Which business unit owns the resource? This is used for cost analysis and support."
  type        = string
  validation {
    condition = anytrue([
      var.business_owner == "digital",
      var.business_owner == "it",
      var.business_owner == "marketing",
    ])
    error_message = "Must have a valid business owner, can be digital, it, marketing."
  }
  default = "digital"
}

variable "customer_facing" {
  description = "Is this resource customer facing? Knowing this will help us drive decisions that may need to be made with short notice."
  type        = bool
  default     = false
}

variable "customer_impacting" {
  description = "Is this resource customer impacting? Leave as \"false\" until criteria are better defined or you are positive it is customer impacting."
  type        = bool
  default     = false
}

variable "iac_type" {
  description = "IAC type for resource? This helps us know how the resource was created"
  type        = string
  validation {
    condition = anytrue([
      var.iac_type == "TF",
      var.iac_type == "CloudFormation",
      var.iac_type == "CDK",
      var.iac_type == "K8",
    ])
    error_message = "Must have a valid business_owner, can be TF, CloudFormation, CDK, K8."
  }
  default = "TF"
}

variable "iac_source" {
  description = "IAC location of resource. This helps us know exactly where the code is that manages the IAC resource"
  type        = string
}

variable "pillar" {
  description = "If “digital” is the business_owner then what pillar owns the resource? This is used for cost analysis and support."
  type        = string
  validation {
    condition = anytrue([
      var.pillar == "platform",
      var.pillar == "commerce",
      var.pillar == "agronomy",
      var.pillar == "crop-planning",
      var.pillar == "data-analytics",
    ])
    error_message = "Must have a valid business owner, can be platform, commerce, agronomy, crop-planning, data-analytics."
  }
}

variable "tags_override" {
  description = "Additional Tags. It should be used whenever we want extend override tags standards with new or existing tags."
  type        = map(any)
  default     = {}
}
