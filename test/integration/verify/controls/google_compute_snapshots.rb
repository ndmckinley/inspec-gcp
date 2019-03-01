# ----------------------------------------------------------------------------
#
#     ***     AUTO GENERATED CODE    ***    AUTO GENERATED CODE     ***
#
# ----------------------------------------------------------------------------
#
#     This file is automatically generated by Magic Modules and manual
#     changes will be clobbered when the file is regenerated.
#
#     Please read more about how to change this file in README.md and
#     CONTRIBUTING.md located at the root of this package.
#
# ----------------------------------------------------------------------------

title 'Test GCP google_compute_snapshots resource.'

gcp_project_id = attribute(:gcp_project_id, default: 'gcp_project_id', description: 'The GCP project identifier.')
gcp_zone = attribute(:gcp_zone, default: 'gcp_zone', description: 'GCP zone name of the compute disk')
gcp_compute_disk_name = attribute(:gcp_compute_disk_name, default: 'gcp_compute_disk_name', description: 'The name of the GCP compute disk to snapshot')
snapshot = attribute('snapshot', default: {
  "name": "inspec-gcp-disk-snapshot"
}, description: 'Compute disk snapshot description')
control 'google_compute_snapshots-1.0' do
  impact 1.0
  title 'google_compute_snapshots resource test'

  describe google_compute_snapshots(project: gcp_project_id) do
    its('count') { should be >= 1 }
  end

  describe.one do
    google_compute_snapshots(project: gcp_project_id).names do |snapshot_name|
      describe google_compute_snapshot(project: gcp_project_id, name: snapshot_name) do
        its('source_disk') { should match gcp_compute_disk_name }
      end
    end
  end
end
