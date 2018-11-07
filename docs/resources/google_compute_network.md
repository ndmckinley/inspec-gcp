

---
title: About the Network resource
platform: gcp2
---

## Syntax
A `google_compute_network` is used to test a Google Network resource

TODO: Examples

## Properties
Properties that can be accessed from the `google_compute_network` resource:

  * `description`: An optional description of this resource. Provide this property when you create the resource.

  * `gateway_ipv4`: A gateway address for default routing to other networks. This value is read only and is selected by the Google Compute Engine, typically as the first usable address in the IPv4Range.

  * `id`: The unique identifier for the resource.

  * `ipv4_range`: The range of internal addresses that are legal on this network. This range is a CIDR specification, for example: 192.168.0.0/16. Provided by the client when the network is created.

  * `name`: Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.

  * `subnetworks`: Server-defined fully-qualified URLs for all subnetworks in this network.

  * `auto_create_subnetworks`: When set to true, the network is created in "auto subnet mode". When set to false, the network is in "custom subnet mode".  In "auto subnet mode", a newly created network is assigned the default CIDR of 10.128.0.0/9 and it automatically creates one subnetwork per region.

  * `creation_timestamp`: Creation timestamp in RFC3339 text format.

  * `routing_config`: The network-level routing configuration for this network. Used by Cloud Router to determine what type of network-wide routing behavior to enforce.

    * `routingMode`: The network-wide routing mode to use. If set to REGIONAL, this network's cloud routers will only advertise routes with subnetworks of this network in the same region as the router. If set to GLOBAL, this network's cloud routers will advertise routes with all subnetworks of this network, across regions.
