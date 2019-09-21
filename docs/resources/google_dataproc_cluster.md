---
title: About the google_dataproc_cluster resource
platform: gcp
---

## Syntax
A `google_dataproc_cluster` is used to test a Google Cluster resource

## Examples
```
describe google_dataproc_cluster(project: 'chef-gcp-inspec', region: 'europe-west2', cluster_name: 'inspec-dataproc-cluster') do
  it { should exist }
  its('labels') { should include('label' => 'value') }
  its('config.master_config.num_instances') { should cmp '1' }
  its('config.worker_config.num_instances') { should cmp '2' }
  its('config.master_config.machine_type_uri') { should match 'n1-standard-1' }
  its('config.worker_config.machine_type_uri') { should match 'n1-standard-1' }
  its('config.software_config.properties') { should include('dataproc:dataproc.allow.zero.workers' => 'true') }
end

describe google_dataproc_cluster(project: 'chef-gcp-inspec', region: 'europe-west2', cluster_name: 'nonexistent') do
  it { should_not exist }
end
```

## Properties
Properties that can be accessed from the `google_dataproc_cluster` resource:

  * `cluster_name`: The name of the cluster, unique within the project and region.

  * `labels`: Labels to apply to this cluster.  A list of key->value pairs.

  * `config`: Configuration for the cluster

    * `config_bucket`: The Cloud Storage staging bucket used to stage files, such as Hadoop jars, between client machines and the cluster.

    * `gce_cluster_config`: Common config settings for resources of Google Compute Engine cluster instances, applicable to all instances in the cluster.

    * `master_config`: The config settings for Compute Engine resources in an instance group, such as a master or worker group.

    * `worker_config`: The config settings for Compute Engine resources in an instance group, such as a master or worker group.

    * `secondary_worker_config`: The config settings for Compute Engine resources in an instance group, such as a master or worker group.

    * `software_config`: Specifies the selection and config of software inside the cluster

    * `initialization_actions`: Specifies an executable to run on a fully configured node and a timeout period for executable completion.

    * `encryption_config`: Encryption settings for the cluster.

    * `security_config`: Kerberos config holder.

  * `region`: The region in which the cluster and associated nodes will be created in.



## GCP Permissions

Ensure the [Cloud Dataproc API](https://console.cloud.google.com/apis/library/dataproc.googleapis.com) is enabled for the current project.
