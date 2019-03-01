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

title 'Test GCP google_compute_disk resource.'

gcp_project_id = attribute(:gcp_project_id, default: 'gcp_project_id', description: 'The GCP project identifier.')
gcp_zone = attribute(:gcp_zone, default: 'gcp_zone', description: 'The GCP project zone.')
gcp_compute_disk_name = attribute(:gcp_compute_disk_name, default: 'gcp_compute_disk_name', description: 'GCP Compute disk name.')
gcp_compute_disk_image = attribute(:gcp_compute_disk_image, default: 'gcp_compute_disk_image', description: 'GCP Compute image identifier.')
gcp_compute_disk_type = attribute(:gcp_compute_disk_type, default: 'gcp_compute_disk_type', description: 'GCP Compute disk type.')
control 'google_compute_disk-1.0' do
  impact 1.0
  title 'google_compute_disk resource test'

  most_recent_image = google_compute_image(project: gcp_compute_disk_image.split('/').first, name: gcp_compute_disk_image.split('/').last)

  describe google_compute_disk(project: gcp_project_id, name: gcp_compute_disk_name, zone: gcp_zone) do
    it { should exist }
    # Test that the image is the most recent image for the family
    its('source_image') { should match most_recent_image.self_link }
    its('type') { should match gcp_compute_disk_type }
  end

  describe.one do
    google_compute_disk(project: gcp_project_id, name: gcp_compute_disk_name, zone: gcp_zone).labels.each_pair do |key, value|
      describe key do
        it { should cmp "environment" }
      end
    end
  end

  describe google_compute_disk(project: gcp_project_id, name: 'nonexistent', zone: gcp_zone) do
    it { should_not exist }
  end
end
