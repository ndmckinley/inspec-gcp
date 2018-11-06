

---
title: About the Image resource
platform: gcp2
---

## Syntax
A `google_compute_image` is used to test a Google Image resource

TODO: Examples

## Properties
Properties that can be accessed from the `google_compute_image` resource:

  * `archive_size_bytes`: Size of the image tar.gz archive stored in Google Cloud Storage (in bytes).

  * `creation_timestamp`: Creation timestamp in RFC3339 text format.

  * `deprecated`: The deprecation status associated with this image.

    * `deleted`: An optional RFC3339 timestamp on or after which the state of this resource is intended to change to DELETED. This is only informational and the status will not change unless the client explicitly changes it.

    * `deprecated`: An optional RFC3339 timestamp on or after which the state of this resource is intended to change to DEPRECATED. This is only informational and the status will not change unless the client explicitly changes it.

    * `obsolete`: An optional RFC3339 timestamp on or after which the state of this resource is intended to change to OBSOLETE. This is only informational and the status will not change unless the client explicitly changes it.

    * `replacement`: The URL of the suggested replacement for a deprecated resource. The suggested replacement resource must be the same kind of resource as the deprecated resource.

    * `state`: The deprecation state of this resource. This can be DEPRECATED, OBSOLETE, or DELETED. Operations which create a new resource using a DEPRECATED resource will return successfully, but with a warning indicating the deprecated resource and recommending its replacement. Operations which use OBSOLETE or DELETED resources will be rejected and result in an error.

  * `description`: An optional description of this resource. Provide this property when you create the resource.

  * `disk_size_gb`: Size of the image when restored onto a persistent disk (in GB).

  * `family`: The name of the image family to which this image belongs. You can create disks by specifying an image family instead of a specific image name. The image family always returns its latest image that is not deprecated. The name of the image family must comply with RFC1035.

  * `guest_os_features`: A list of features to enable on the guest OS. Applicable for bootable images only. Currently, only one feature can be enabled, VIRTIO_SCSI_MULTIQUEUE, which allows each virtual CPU to have its own queue. For Windows images, you can only enable VIRTIO_SCSI_MULTIQUEUE on images with driver version 1.2.0.1621 or higher. Linux images with kernel versions 3.17 and higher will support VIRTIO_SCSI_MULTIQUEUE.  For new Windows images, the server might also populate this field with the value WINDOWS, to indicate that this is a Windows image. This value is purely informational and does not enable or disable any features.

    * `type`: The type of supported feature. Currenty only VIRTIO_SCSI_MULTIQUEUE is supported. For newer Windows images, the server might also populate this property with the value WINDOWS to indicate that this is a Windows image. This value is purely informational and does not enable or disable any features.

  * `id`: The unique identifier for the resource. This identifier is defined by the server.

  * `image_encryption_key`: Encrypts the image using a customer-supplied encryption key.  After you encrypt an image with a customer-supplied key, you must provide the same key if you use the image later (e.g. to create a disk from the image)

    * `rawKey`: Specifies a 256-bit customer-supplied encryption key, encoded in RFC 4648 base64 to either encrypt or decrypt this resource.

    * `sha256`: The RFC 4648 base64 encoded SHA-256 hash of the customer-supplied encryption key that protects this resource.

  * `licenses`: Any applicable license URI.

  * `name`: Name of the resource; provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.

  * `raw_disk`: The parameters of the raw disk image.

    * `containerType`: The format used to encode and transmit the block device, which should be TAR. This is just a container and transmission format and not a runtime format. Provided by the client when the disk image is created.

    * `sha1Checksum`: An optional SHA1 checksum of the disk image before unpackaging. This is provided by the client when the disk image is created.

    * `source`: The full Google Cloud Storage URL where disk storage is stored You must provide either this property or the sourceDisk property but not both.

  * `source_disk`: Refers to a gcompute_disk object You must provide either this property or the rawDisk.source property but not both to create an image.

  * `source_disk_encryption_key`: The customer-supplied encryption key of the source disk. Required if the source disk is protected by a customer-supplied encryption key.

    * `rawKey`: Specifies a 256-bit customer-supplied encryption key, encoded in RFC 4648 base64 to either encrypt or decrypt this resource.

    * `sha256`: The RFC 4648 base64 encoded SHA-256 hash of the customer-supplied encryption key that protects this resource.

  * `source_disk_id`: The ID value of the disk used to create this image. This value may be used to determine whether the image was taken from the current or a previous instance of a given disk name.

  * `source_type`: The type of the image used to create this disk. The default and only value is RAW
