require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module YanbaruSpace
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    config.i18n.default_locale = :ja

    config.generators do |g|
      g.assets false
      g.skip_routes false  
      g.helper false
      g.test_framework :rspec, view_specs: false, helper_specs: false, fixture: true
    end
  end
end
