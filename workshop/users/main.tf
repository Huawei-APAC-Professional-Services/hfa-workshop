
resource "random_password" "securityadmin" {
  length           = 8
  special          = true
}

resource "huaweicloud_identity_user" "securityadmin" {
  name        = "security_admin"
  description = "user for security administration"
  password    = random_password.securityadmin.result
  pwd_reset = false
  lifecycle {
    ignore_changes = [ password ]
  }
}

resource "huaweicloud_identity_group_membership" "Security_Admin" {
  group = huaweicloud_identity_group.IAM_Account_Security_Group.id
  users = [
    huaweicloud_identity_user.securityadmin.id
  ]
}

output "Security_Admin_Password" {
  sensitive = true
  value = random_password.securityadmin.result
}