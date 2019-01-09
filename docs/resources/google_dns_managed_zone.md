---
title: About the ManagedZone resource
platform: gcp
---


## Syntax
A `google_dns_managed_zone` is used to test a Google ManagedZone resource

## Examples
```
describe google_dns_managed_zone(project: 'chef-gcp-inspec', name: 'inspec-gcp-managed-zone') do
  it { should exist }
  its('name') { should eq 'inspec-gcp-managed-zone' }
  its('dns_name') { should eq 'my.domain.com.' }
  its('description') { should include 'A test DNS zone' }
end
```

## Properties
Properties that can be accessed from the `google_dns_managed_zone` resource:

  * `description`: A mutable string of at most 1024 characters associated with this resource for the user's convenience. Has no effect on the managed zone's function.

  * `dns_name`: The DNS name of this managed zone, for instance "example.com.".

  * `id`: Unique identifier for the resource; defined by the server.

  * `name`: User assigned name for this resource. Must be unique within the project.

  * `name_servers`: Delegate your managed_zone to these virtual name servers; defined by the server

  * `name_server_set`: Optionally specifies the NameServerSet for this ManagedZone. A NameServerSet is a set of DNS name servers that all host the same ManagedZones. Most users will leave this field unset.

  * `creation_time`: The time that this resource was created on the server. This is in RFC3339 text format.

  * `labels`: A set of key/value label pairs to assign to this ManagedZone.
