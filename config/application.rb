require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

#Added to fix devise/active admin issue ?
config.assets.initialize_on_precompile = false

# Precompile additional assets. Defaults to [application.js, application.css, non-JS/CSS]
config.assets.precompile += ['active_admin.css.scss', 'active_admin.js'] 

module Rsvp
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
