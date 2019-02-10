require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Chewie
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    config.i18n.default_locale = 'pt-BR'
    config.action_view.raise_on_missing_translations = true
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**/*.{yml}').to_s]
    config.assets.paths << Rails.root.join("app", "assets", "fonts")
  end
end
