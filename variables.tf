variable "firebase_app_hosting_domains" {
  description = <<EOT
Map of firebase_app_hosting_domains, attributes below
Required:
    - backend
    - domain_id
    - location
Optional:
    - deletion_policy
    - project
    - serve (block):
        - redirect (optional, block):
            - status (optional)
            - uri (required)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    backend         = string
    domain_id       = string
    location        = string
    deletion_policy = optional(string)
    project         = optional(string)
    serve = optional(object({
      redirect = optional(object({
        status = optional(string)
        uri    = string
      }))
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
}

