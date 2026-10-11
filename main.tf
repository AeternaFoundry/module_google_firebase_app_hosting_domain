resource "google_firebase_app_hosting_domain" "firebase_app_hosting_domains" {
  for_each = var.firebase_app_hosting_domains

  backend         = each.value.backend
  domain_id       = each.value.domain_id
  location        = each.value.location
  deletion_policy = each.value.deletion_policy
  project         = each.value.project

  dynamic "serve" {
    for_each = each.value.serve != null ? [each.value.serve] : []
    content {
      dynamic "redirect" {
        for_each = serve.value.redirect != null ? [serve.value.redirect] : []
        content {
          status = redirect.value.status
          uri    = redirect.value.uri
        }
      }
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

