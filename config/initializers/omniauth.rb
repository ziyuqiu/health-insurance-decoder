OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '1028609438162-0rapbmf2uo105nrgvgt92818iujvpbcs.apps.googleusercontent.com', 'wRk-TPJgVLJsEeET_-fW-jOH', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end
