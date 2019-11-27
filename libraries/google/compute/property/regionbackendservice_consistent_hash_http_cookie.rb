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
require 'google/compute/property/regionbackendservice_consistent_hash_http_cookie_ttl'
module GoogleInSpec
  module Compute
    module Property
      class RegionBackendServiceConsistentHashHttpCookie
        attr_reader :ttl

        attr_reader :name

        attr_reader :path

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @ttl = GoogleInSpec::Compute::Property::RegionBackendServiceConsistentHashHttpCookieTtl.new(args['ttl'], to_s)
          @name = args['name']
          @path = args['path']
        end

        def to_s
          "#{@parent_identifier} RegionBackendServiceConsistentHashHttpCookie"
        end
      end
    end
  end
end
