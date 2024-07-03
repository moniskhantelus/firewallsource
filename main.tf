resource "google_compute_firewall" "rules" {
  for_each  = { for rule in var.rules : rule.name => rule }
  project   = var.project_id
  name      = each.value.name
  network   = var.network
  priority  = each.value.priority
  direction = each.value.direction
  allow {
    protocol = each.value.protocol
    ports    = (each.value.ports != null) ? each.value.ports : null
  }
  source_ranges           = (each.value.direction == "INGRESS") ? each.value.source_ranges : null
  destination_ranges      = (each.value.direction == "EGRESS") ? each.value.destination_ranges : null
  source_tags             = (each.value.use_service_accounts == false && each.value.direction == "INGRESS") ? each.value.source_tags : null
  target_tags             = (each.value.use_service_accounts == false) ? each.value.target_tags : null
  source_service_accounts = (each.value.use_service_accounts == true && each.value.direction == "INGRESS") ? each.value.source_service_accounts : null
  target_service_accounts = (each.value.use_service_accounts == true) ? each.value.target_service_accounts : null
  log_config {
    metadata = var.log_config_metadata
  }
}
