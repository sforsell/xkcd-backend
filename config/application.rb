require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Xkcd
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.eager_load = true
    config.load_defaults 5.1
    config.action_dispatch.default_headers = {
      'Access-Control-Allow-Origin' => '*',
      'Access-Control-Request-Method' => '*'
    }

    # config.action_controller.forgery_protection_origin_check = false
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    Rails.application.config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins ['localhost:3001', 'xkcd.com']
        resource '*',
          headers: :any,
          methods: %i(get post put patch delete head)
      end
    end
  end
end
