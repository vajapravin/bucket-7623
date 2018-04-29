# frozen_string_literal: true

# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

Rails.application.config.middleware.insert_before 0, Rack::Cors, debug: true, logger: (-> { Rails.logger }) do
  allow do
    origins ENV['ALLOWED_CORS_ORIGINS'].split(',').map(&:strip)

    resource '*',
             headers: :any,
             credentials: true,
             methods: [:get, :post, :options, :delete, :put, :patch],
             expose: ['Ally-Auth-Token']
  end
end