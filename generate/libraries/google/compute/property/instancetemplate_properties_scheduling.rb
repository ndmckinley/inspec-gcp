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
  module Compute
    module Property
      class InstanceTemplatePropertiesScheduling
        attr_reader :arguments

        attr_reader :automatic_restart

        attr_reader :on_host_maintenance

        attr_reader :preemptible

        def initialize(arguments = nil, parent_identifier = nil)
          @arguments = arguments
          return if arguments.nil?
          @parent_identifier = parent_identifier
          @automatic_restart = arguments['automaticRestart']
          @on_host_maintenance = arguments['onHostMaintenance']
          @preemptible = arguments['preemptible']
        end

        def to_s
          "#{@parent_identifier} InstanceTemplatePropertiesScheduling"
        end

        def self.un_parse(item, current_path)
          return if item.nil?
          way_to_parse = {
            'automatic_restart' => ->(x, path) { x.nil? ? [] : ["its('#{path}.automatic_restart') { should cmp #{x.inspect} }"] },
            'on_host_maintenance' => ->(x, path) { x.nil? ? [] : ["its('#{path}.on_host_maintenance') { should cmp #{x.inspect} }"] },
            'preemptible' => ->(x, path) { x.nil? ? [] : ["its('#{path}.preemptible') { should cmp #{x.inspect} }"] },
          }
          way_to_parse.map do |k, v|
            v.call(item.method(k).call, current_path)
          end
        end

        def to_json(*_args)
          @arguments.to_json
        end

        # other is a string representation of this object
        def ==(other)
          @arguments == JSON.parse(other)
        end
      end
    end
  end
end