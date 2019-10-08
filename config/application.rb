require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Stocks
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.exception_handler = {
          dev:        true, # allows you to turn ExceptionHandler "on" in development
          db:         nil, # allocates a "table name" into which exceptions are saved (defaults to nil)
          email:      nil, # sends exception emails to a listed email (string // "you@email.com")


    }
  end
end
