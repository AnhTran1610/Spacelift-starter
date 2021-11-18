provider "spacelift" {}

terraform {
  required_providers {
    spacelift = {
      source = "spacelift-io/spacelift"
    }
  }
}

resource "spacelift_stack" "this" {
  administrative    = false
  autodeploy        = false
  branch            = "master"
  description       = "Testing workflow"
  name              = "Spacelift-starter"
  repository        = "spacelift-starter"
  terraform_version = "1.0.5"
}

resource "spacelift_stack" "new" {
  administrative    = false
  autodeploy        = false
  branch            = "master"
  description       = "Testing workflow"
  name              = "Another stack"
  repository        = "Spacelift"
  terraform_version = "1.0.5"
}

resource "spacelift_environment_variable" "stack-plaintext" {
  stack_id   = spacelift_stack.this.id
  name       = "TF_VAR_stack_public"
  value      = "This should be visible!"
  write_only = false
}

# For another (secret) variable, let's create programmatically create a super
# secret password.


# This is a secret environment variable. Note how we didn't set the write_only
# bit at all here. This setting always defaults to "true" to protect you against
# an accidental leak of secrets. There will be no way to retrieve the value of
# this variable programmatically, but it will be available to your Spacelift
# runs.
#
# If you accidentally print it out to the logs, no worries: we will obfuscate
# every secret thing we know of.
resource "spacelift_environment_variable" "stack-writeonly" {
  stack_id = spacelift_stack.this.id
  name     = "TF_VAR_stack_secret"
  value    = "123456"
  write_only = false
}
