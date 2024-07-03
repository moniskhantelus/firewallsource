output "self_links" {
  value = {
    for rule in google_compute_firewall.rules :
    rule.name => rule.self_link
  }
}
