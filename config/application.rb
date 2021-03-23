require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ActiveJobDemo
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.active_job.queue_adapter = :sidekiq

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.action_mailer.perform_deliveries = true
    config.action_mailer.raise_delivery_errors = true
    config.action_mailer.smtp_settings = {
      address: Rails.application.credentials.mailer[:address],
      port: 587,
      domain: Rails.application.credentials.mailer[:domain],
      user_name: Rails.application.credentials.mailer[:user_name],
      password: Rails.application.credentials.mailer[:password],
      authentication: :plain,
      enable_starttls_auto: true
    }
  end
end
