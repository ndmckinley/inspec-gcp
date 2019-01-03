---
title: About the Disk resource
platform: gcp
---


## Syntax
A `google_compute_disk` is used to test a Google Disk resource

## Examples
```
most_recent_image = google_compute_image({project: 'debian', name: 'debian-8-jessie-v20170523'})

describe google_compute_disk({project: 'chef-inspec-gcp', name: 'my_disk', zone: 'zone'}) do
  it { should exist }
  # Test that the image is the most recent image for the family
  its('source_image') { should match most_recent_image.self_link }
  its('type') { should match 'gcp_compute_disk_type' }
end

describe.one do
 	google_compute_disk({project: 'chef-inspec-gcp', name: 'my_disk', zone: 'zone'}).labels.each_pair do |key, value|
    describe key do
      it { should cmp "environment" }
    end
  end
end
```

## Properties
Properties that can be accessed from the `google_compute_disk` resource:

  * `label_fingerprint`: The fingerprint used for optimistic locking of this resource.  Used internally during updates.

  * `creation_timestamp`: Creation timestamp in RFC3339 text format.

  * `description`: An optional description of this resource. Provide this property when you create the resource.

  * `id`: The unique identifier for the resource.

  * `last_attach_timestamp`: Last attach timestamp in RFC3339 text format.

  * `last_detach_timestamp`: Last dettach timestamp in RFC3339 text format.

  * `labels`: Labels to apply to this disk.  A list of key->value pairs.

  * `licenses`: Any applicable publicly visible licenses.

  * `name`: Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.

  * `size_gb`: Size of the persistent disk, specified in GB. You can specify this field when creating a persistent disk using the sourceImage or sourceSnapshot parameter, or specify it alone to create an empty persistent disk.  If you specify this field along with sourceImage or sourceSnapshot, the value of sizeGb must not be less than the size of the sourceImage or the size of the snapshot.

  * `users`: Links to the users of the disk (attached instances) in form: project/zones/zone/instances/instance

  * `type`: URL of the disk type resource describing which disk type to use to create the disk. Provide this when creating the disk.

  * `source_image`: The source image used to create this disk. If the source image is deleted, this field will not be set.  To create a disk with one of the public operating system images, specify the image by its family name. For example, specify family/debian-8 to use the latest Debian 8 image:  projects/debian-cloud/global/images/family/debian-8  Alternatively, use a specific version of a public operating system image:  projects/debian-cloud/global/images/debian-8-jessie-vYYYYMMDD  To create a disk with a private image that you created, specify the image name in the following format:  global/images/my-private-image  You can also specify a private image by its image family, which returns the latest version of the image in that family. Replace the image name with family/family-name:  global/images/family/my-private-family
