# Copyright 2018 Google Inc.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

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

require 'inspec/resource'
require 'google/hash_utils'
class Zones < Inspec.resource(1)

  name 'google_compute_zones'
  desc 'Zone plural resource'
  supports platform: 'gcp2'

  filter_table_config = FilterTable.create

  filter_table_config.add(:creation_timestamps, field: :creation_timestamp)
  filter_table_config.add(:deprecateds, field: :deprecated)
  filter_table_config.add(:descriptions, field: :description)
  filter_table_config.add(:ids, field: :id)
  filter_table_config.add(:names, field: :name)
  filter_table_config.add(:regions, field: :region)
  filter_table_config.add(:statuses, field: :status)

  filter_table_config.connect(self, :fetch_data)

  def base
    'https://www.googleapis.com/compute/v1/'
  end

  def url
    'projects/{{project}}/zones'
  end

  def initialize(params = {}) 
    @params = params
  end

  def fetch_resource(params)
    get_request = inspec.backend.fetch(base, url, params)
  end

  def fetch_data
  	@data = fetch_wrapped_resource('compute#zoneList', 'items')
  end

  def fetch_wrapped_resource(wrap_kind, wrap_path)
    result = fetch_resource(@params)
    return if result.nil? || !result.key?(wrap_path)

    # Conversion of string -> object hash to symbol -> object hash that InSpec needs
    result[wrap_path].map { |hash| Google::HashUtils.symbolize_keys(hash) }
  end

end
