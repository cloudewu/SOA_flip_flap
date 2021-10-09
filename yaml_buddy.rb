# frozen_string_literal: true

require 'yaml'

# Module that can be included (mixin) to take and output Yaml data
module YamlBuddy
  def take_yaml(yaml)
    @data = YAML.safe_load(yaml)
  end

  def to_yaml
    @data.to_yaml
  end
end
