
# Load a YML file in the config/ directory
# - env is not required
config = Rails.application.config_for(:cable, env: Rails.env)
# => ActiveSupport::OrderedOptions (fanci hash) with yaml keys

config.adapter # ActiveSupport::OrderedOptions adds methods for config keys
# => "redis"

# config/example.yml
shared: # shared keys are merged into all envs
  foo:
    bar:
      baz: 1

development: # must define env TOP LEVEL KEY for config to be loaded
  foo:
    bar:
      qux: 2