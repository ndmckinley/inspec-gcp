

---
title: About the Region resource
platform: gcp2
---

## Syntax
A `google_compute_region` is used to test a Google Region resource

TODO: Examples

## Properties
Properties that can be accessed from the `google_compute_region` resource:

  * `creation_timestamp`: Creation timestamp in RFC3339 text format.

  * `deprecated`: The deprecation state of this resource.

    * `deleted`: An optional RFC3339 timestamp on or after which the deprecation state of this resource will be changed to DELETED.

    * `deprecated`: An optional RFC3339 timestamp on or after which the deprecation state of this resource will be changed to DEPRECATED.

    * `obsolete`: An optional RFC3339 timestamp on or after which the deprecation state of this resource will be changed to OBSOLETE.

    * `replacement`: The URL of the suggested replacement for a deprecated resource. The suggested replacement resource must be the same kind of resource as the deprecated resource.

    * `state`: The deprecation state of this resource. This can be DEPRECATED, OBSOLETE, or DELETED. Operations which create a new resource using a DEPRECATED resource will return successfully, but with a warning indicating the deprecated resource and recommending its replacement. Operations which use OBSOLETE or DELETED resources will be rejected and result in an error.

  * `description`: An optional description of this resource.

  * `id`: The unique identifier for the resource.

  * `name`: Name of the resource.

  * `zones`: List of zones within the region
