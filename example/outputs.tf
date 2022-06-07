output "name" {
  description = "AWS Environment Name"
  value       = module.test.name
}

output "tags" {
  description = "AWS Resource Tagging"
  value       = module.test.tags
}
