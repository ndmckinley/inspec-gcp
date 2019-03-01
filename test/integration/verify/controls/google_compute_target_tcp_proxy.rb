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

title 'Test GCP google_compute_target_tcp_proxy resource.'

gcp_project_id = attribute(:gcp_project_id, default: 'gcp_project_id', description: 'The GCP project identifier.')
target_tcp_proxy = attribute('target_tcp_proxy', default: {
  "name": "inspec-gcp-target-tcp-proxy",
  "proxy_header": "NONE",
  "tcp_backend_service_name": "gcp-inspec-tcp-backend-service"
}, description: 'Compute TCP proxy definition')
control 'google_compute_target_tcp_proxy-1.0' do
  impact 1.0
  title 'google_compute_target_tcp_proxy resource test'
  describe google_compute_target_tcp_proxy(project: gcp_project_id, name: target_tcp_proxy['name']) do
    it { should exist }
    its('proxy_header') { should eq target_tcp_proxy['proxy_header'] }
    its('service') { should  match /\/gcp-inspec-tcp-backend-service$/ }
  end

  describe google_compute_target_tcp_proxy(project: gcp_project_id, name: 'nonexistent') do
    it { should_not exist }
  end
end
