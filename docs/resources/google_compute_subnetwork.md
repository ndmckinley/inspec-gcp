

---
title: About the Subnetwork resource
platform: gcp2
---

## Syntax
A `google_compute_subnetwork` is used to test a Google Subnetwork resource

TODO: Examples

## Properties
Properties that can be accessed from the `google_compute_subnetwork` resource:

  * `creation_timestamp`: Creation timestamp in RFC3339 text format.

  * `description`: An optional description of this resource. Provide this property when you create the resource. This field can be set only at resource creation time.

  * `gateway_address`: The gateway address for default routes to reach destination addresses outside this subnetwork.

  * `id`: The unique identifier for the resource.

  * `ip_cidr_range`: The range of internal addresses that are owned by this subnetwork. Provide this property when you create the subnetwork. For example, 10.0.0.0/8 or 192.168.0.0/16. Ranges must be unique and non-overlapping within a network. Only IPv4 is supported.

  * `name`: The name of the resource, provided by the client when initially creating the resource. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.

  * `network`: The network this subnet belongs to. Only networks that are in the distributed mode can have subnetworks.

  * `enable_flow_logs`: Whether to enable flow logging for this subnetwork.

  * `fingerprint`: Fingerprint of this resource. This field is used internally during updates of this resource.

  * `secondary_ip_ranges`: An array of configurations for secondary IP ranges for VM instances contained in this subnetwork. The primary IP of such VM must belong to the primary ipCidrRange of the subnetwork. The alias IPs may belong to either primary or secondary ranges.

    * `rangeName`: The name associated with this subnetwork secondary range, used when adding an alias IP range to a VM instance. The name must be 1-63 characters long, and comply with RFC1035. The name must be unique within the subnetwork.

    * `ipCidrRange`: The range of IP addresses belonging to this subnetwork secondary range. Provide this property when you create the subnetwork. Ranges must be unique and non-overlapping with all primary and secondary IP ranges within a network. Only IPv4 is supported.

  * `private_ip_google_access`: Whether the VMs in this subnet can access Google services without assigned external IP addresses.

  * `region`: URL of the GCP region for this subnetwork.
