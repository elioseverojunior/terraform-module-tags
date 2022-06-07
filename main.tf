/*
  Tags Standards: https://agrium.atlassian.net/wiki/spaces/DCE/pages/1120993626/AWS+-+Resource+Tagging
  Last updated: Mar 21, 2022 by Joe.Rogers
*/
locals {
  name = format("%s-%s-%s", lower(var.country), lower(var.runtime), lower(var.application))
  default_tags = {
    business_owner     = title(var.business_owner)
    cost_center        = var.cost_center == "" || var.cost_center == null ? "" : var.cost_center
    country            = upper(var.country)
    customer_facing    = var.customer_facing
    customer_impacting = var.customer_impacting
    description        = var.description == "" || var.description == null ? "" : var.description
    environment        = var.runtime
    iac_source         = var.iac_source
    iac_type           = var.iac_type
    iac_workspace      = format("%s-%s-%s", lower(var.application), lower(var.country), lower(var.runtime))
    market             = upper(var.country)
    pillar             = var.pillar
    runtime            = lower(var.runtime)
  }
  tags = merge(local.default_tags, var.tags_override)
}
