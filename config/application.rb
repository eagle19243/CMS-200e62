require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module P200e62
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    config.generators.stylesheets = false
    config.generators.javascripts = false

    config.action_mailer.delivery_method = :smtp

    config.action_mailer.smtp_settings = {
      address:              Rails.application.secrets.email_server_address,
      port:                 Rails.application.secrets.email_port,
      domain:               Rails.application.secrets.email_domain,
      user_name:            Rails.application.secrets.email_user_name,
      password:             Rails.application.secrets.email_password,
      authentication:       'login',
      enable_starttls_auto: true
    }

    config.action_mailer.default_options = {
      from: Rails.application.secrets.registrant_mailer_default_from
    }
  end
end
