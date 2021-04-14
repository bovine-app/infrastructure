locals {
  admins = [
    "jbhannah"
  ]

  members = []
}

resource "github_membership" "admins" {
  for_each = toset(local.admins)

  username = each.key
  role     = "admin"
}

resource "github_membership" "members" {
  for_each = toset(local.members)

  username = each.key
  role     = "member"
}
