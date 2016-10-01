require_relative 'tsv_buddy'
require_relative 'yaml_buddy'

# This file's FlipFlap class should mix in TsvBuddy and YamlBuddy modules (using include).
# Mixing these modules in will give class FlipFlap all of TsvBuddy's and YamlBuddy's methods.

# Converts tabular data between storage formats
class FlipFlap
  # Do NOT create an initialize method
  include TsvBuddy
  include YamlBuddy
  attr_reader :data

  def self.input_formats
    method_names = instance_methods.map(&:to_s)
    outputs = method_names.select { |method| method.match(/^take_/) }
    outputs ? outputs.map { |method| method[5..-1] } : []
  end
end
