Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['google_client_id'], ENV['google_client_secret']
  #provider :google_oauth2, Rails.application.credentials.google[:google_client_id], Rails.application.credentials.aws[:google_client_secret]
end