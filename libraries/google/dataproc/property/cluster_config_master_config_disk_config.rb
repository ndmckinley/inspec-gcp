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
module GoogleInSpec
  module Dataproc
    module Property
      class ClusterConfigMasterConfigDiskConfig
        attr_reader :boot_disk_type

        attr_reader :boot_disk_size_gb

        attr_reader :num_local_ssds

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @boot_disk_type = args['bootDiskType']
          @boot_disk_size_gb = args['bootDiskSizeGb']
          @num_local_ssds = args['numLocalSsds']
        end

        def to_s
          "#{@parent_identifier} ClusterConfigMasterConfigDiskConfig"
        end
      end
    end
  end
end
