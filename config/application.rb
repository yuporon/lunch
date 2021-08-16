require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Lunch
  class Application < Rails::Application
    config.load_defaults 6.1
    config.paths.add 'lib', eager_load: true
    config.time_zone = 'Tokyo'
    config.i18n.default_locale = :ja
    config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
  end
end
