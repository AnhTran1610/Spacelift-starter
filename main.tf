provider "spacelift" {
  api_key_endpoint = "https://anhtran1610.app.spacelift.io/"
  api_key_id = "01FM9H98R71Q0X3XE436QA8YFD"
  api_key_secret = "023ee44c39a47fbe559e0d46cdd3cc42e7c3db38b6f8784cdaffc4c96a9d7e1b"
}

terraform {
  required_providers {
    spacelift = {
      source = "spacelift-io/spacelift"
    }
  }
}

resource "spacelift_stack" "this" {
  administrative    = true
  autodeploy        = true
  branch            = "master"
  description       = "Testing workflow"
  name              = "Spacelift-starter"
  repository        = "spacelift-starter"
  terraform_version = "1.0.5"
  project_root = "managed-stack"
}
