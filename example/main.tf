module "test" {
  source             = "../"
  application        = var.application
  business_owner     = var.business_owner
  country            = var.country
  customer_facing    = var.customer_facing
  customer_impacting = var.customer_impacting
  runtime            = var.runtime
  iac_source         = var.iac_source
  iac_type           = var.iac_type
  pillar             = var.pillar
  tags_override      = var.tags_override
}
