---
title: About the google_cloudbuild_trigger_iam_policy resource
platform: gcp
---

## Syntax
A `google_cloudbuild_trigger_iam_policy` is used to test a Google Trigger Iam Policy resource

## Examples
```
describe google_cloudbuild_trigger_iam_policy(project: "project", id: "id") do
  it { should exist }
end

describe google_cloudbuild_trigger_iam_policy(project: "project", id: "id").bindings do |binding|
  its('role') { should_not eq 'roles/owner' }
end
```

## Properties
Properties that can be accessed from the `google_cloudbuild_trigger_iam_policy` resource:

  * `bindings`: Associates a list of members to a role.

    * `role`: Role that is assigned to members. For example, roles/viewer, roles/editor, or roles/owner.

    * `members`: Specifies the identities requesting access for a Cloud Platform resource.

  * `audit_configs`: Specifies cloud audit logging configuration for this policy.

    * `service`: Specifies a service that will be enabled for audit logging. For example, `storage.googleapis.com`, `cloudsql.googleapis.com`. `allServices`  is a special value that covers all services.

    * `audit_log_configs`: The configuration for logging of each type of permission.



## GCP Permissions

Ensure the [Cloud Build API](https://console.cloud.google.com/apis/library/cloudbuild.googleapis.com/) is enabled for the current project.
