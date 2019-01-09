---
title: About the ManagedZone resource
platform: gcp
---


## Syntax
A `google_dns_managed_zones` is used to test a Google ManagedZone resource

## Examples
```
describe google_dns_managed_zones(project: 'chef-gcp-inspec') do
  its('count') { should eq 1 }
  its('names') { should include 'inspec-gcp-managed-zone' }
  its('dns_names') { should include 'my.domain.com.' }
  its('descriptions') { should include 'A test DNS zone' }
end
```

## Properties
Properties that can be accessed from the `google_dns_managed_zones` resource:

See [google_dns_managed_zone.md](google_dns_managed_zone.md) for more detailed information
  * `descriptions`: an array of `google_dns_managed_zone` description
  * `dns_names`: an array of `google_dns_managed_zone` dns_name
  * `ids`: an array of `google_dns_managed_zone` id
  * `names`: an array of `google_dns_managed_zone` name
  * `name_servers`: an array of `google_dns_managed_zone` name_servers
  * `name_server_sets`: an array of `google_dns_managed_zone` name_server_set
  * `creation_times`: an array of `google_dns_managed_zone` creation_time
  * `labels`: an array of `google_dns_managed_zone` labels

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.
