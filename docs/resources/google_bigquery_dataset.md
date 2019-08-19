---
title: About the google_bigquery_dataset resource
platform: gcp
---

## Syntax
A `google_bigquery_dataset` is used to test a Google Dataset resource

## Examples
```
describe google_bigquery_dataset(project: 'chef-gcp-inspec', name: 'inspec_gcp_dataset') do
  it { should exist }

  its('friendly_name') { should eq 'A BigQuery dataset test' }
  its('location') { should eq 'EU' }
  its('description') { should eq 'Test BigQuery dataset description' }
  its('name') { should eq 'inspec_gcp_dataset' }
  its('default_table_expiration_ms') { should cmp '3600000' }
end

describe.one do
  google_bigquery_dataset(project: 'chef-gcp-inspec', name: 'inspec_gcp_dataset').access.each do |dataset_access|
    describe dataset_access do
      its('role') { should eq 'WRITER' }
      its('special_group') { should eq 'projectWriters' }
    end
  end
end

describe google_bigquery_dataset(project: 'chef-gcp-inspec', name: 'nonexistent') do
  it { should_not exist }
end
```

## Properties
Properties that can be accessed from the `google_bigquery_dataset` resource:

  * `access`: Access controls on the bucket.

    * `domain`: A domain to grant access to. Any users signed in with the domain specified will be granted the specified access

    * `group_by_email`: An email address of a Google Group to grant access to

    * `role`: Describes the rights granted to the user specified by the other member of the access object

    * `special_group`: A special group to grant access to.

    * `user_by_email`: An email address of a user to grant access to. For example: fred@example.com

    * `view`: A view from a different dataset to grant access to. Queries executed against that view will have read access to tables in this dataset. The role field is not required when this field is set. If that view is updated by any user, access to the view needs to be granted again via an update operation.

  * `creation_time`: The time when this dataset was created, in milliseconds since the epoch.

  * `dataset_reference`: A reference that identifies the dataset.

    * `dataset_id`: A unique ID for this dataset, without the project name. The ID must contain only letters (a-z, A-Z), numbers (0-9), or underscores (_). The maximum length is 1,024 characters.

    * `project_id`: The ID of the project containing this dataset.

  * `default_table_expiration_ms`: The default lifetime of all tables in the dataset, in milliseconds.  Once this property is set, all newly-created partitioned tables in the dataset will have an `expirationMs` property in the `timePartitioning` settings set to this value, and changing the value will only affect new tables, not existing ones. The storage in a partition will have an expiration time of its partition time plus this value. Setting this property overrides the use of `defaultTableExpirationMs` for partitioned tables: only one of `defaultTableExpirationMs` and `defaultPartitionExpirationMs` will be used for any new partitioned table. If you provide an explicit `timePartitioning.expirationMs` when creating or updating a partitioned table, that value takes precedence over the default partition expiration time indicated by this property.

  * `default_partition_expiration_ms`: This default partition expiration, expressed in milliseconds. When new time-partitioned tables are created in a dataset where this property is set, the table will inherit this value, propagated as the TimePartitioning.expirationMs property on the new table.  If you set TimePartitioning.expirationMs explicitly when creating a table, the defaultPartitionExpirationMs of the containing dataset is ignored.  When creating a partitioned table, if defaultPartitionExpirationMs is set, the defaultTableExpirationMs value is ignored and the table will not be inherit a table expiration deadline.

  * `description`: A user-friendly description of the dataset

  * `etag`: A hash of the resource.

  * `friendly_name`: A descriptive name for the dataset

  * `id`: The fully-qualified unique name of the dataset in the format projectId:datasetId. The dataset name without the project name is given in the datasetId field

  * `labels`: The labels associated with this dataset. You can use these to organize and group your datasets

  * `last_modified_time`: The date when this dataset or any of its tables was last modified, in milliseconds since the epoch.

  * `location`: The geographic location where the dataset should reside. See [official docs].(https://cloud.google.com/bigquery/docs/dataset-locations)  There are two types of locations, regional or multi-regional. A regional location is a specific geographic place, such as Tokyo, and a multi-regional location is a large geographic area, such as the United States, that contains at least two geographic places.  Possible regional values include: `asia-east1`, `asia-northeast1`, `asia-southeast1`, `australia-southeast1`, `europe-north1`, `europe-west2` and `us-east4`.  Possible multi-regional values: `EU` and `US`.  The default value is multi-regional location `US`. Changing this forces a new resource to be created.



## GCP Permissions

Ensure the [BigQuery API](https://console.cloud.google.com/apis/library/bigquery-json.googleapis.com/) is enabled for the current project.
