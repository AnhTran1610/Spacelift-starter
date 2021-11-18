resource "spacelift_stack" "first-stack" {
  administrative    = false
  autodeploy        = false
  branch            = "master"
  description       = "Testing workflow"
  name              = "QUICK LAB"
  repository        = "quick_lab"
  terraform_version = "1.0.5"
}