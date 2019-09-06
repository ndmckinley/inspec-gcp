# frozen_string_literal: false

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
require 'gcp_backend'
require 'google/compute/property/urlmap_host_rules'
require 'google/compute/property/urlmap_path_matchers'
require 'google/compute/property/urlmap_tests'

# A provider to manage Compute Engine resources.
class UrlMap < GcpResourceBase
  name 'google_compute_url_map'
  desc 'UrlMap'
  supports platform: 'gcp'

  attr_reader :params
  attr_reader :creation_timestamp
  attr_reader :default_service
  attr_reader :description
  attr_reader :host_rules
  attr_reader :id
  attr_reader :fingerprint
  attr_reader :name
  attr_reader :path_matchers
  attr_reader :tests

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url, resource_base_url, params, 'Get')
    parse unless @fetched.nil?
  end

  def parse
    @creation_timestamp = parse_time_string(@fetched['creationTimestamp'])
    @default_service = @fetched['defaultService']
    @description = @fetched['description']
    @host_rules = GoogleInSpec::Compute::Property::UrlMapHostRulesArray.parse(@fetched['hostRules'], to_s)
    @id = @fetched['id']
    @fingerprint = @fetched['fingerprint']
    @name = @fetched['name']
    @path_matchers = GoogleInSpec::Compute::Property::UrlMapPathMatchersArray.parse(@fetched['pathMatchers'], to_s)
    @tests = GoogleInSpec::Compute::Property::UrlMapTestsArray.parse(@fetched['tests'], to_s)
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "UrlMap #{@params[:name]}"
  end

  private

  def product_url
    'https://www.googleapis.com/compute/v1/'
  end

  def resource_base_url
    'projects/{{project}}/global/urlMaps/{{name}}'
  end
end
