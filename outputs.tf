output "name" {
  description = "AWS Environment Name"
  value       = local.name
}

output "tags" {
  description = "AWS Resource Tagging"
  value       = local.tags
}
