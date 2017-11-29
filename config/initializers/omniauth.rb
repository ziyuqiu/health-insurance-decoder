OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  puts "init"
  # provider :google_oauth2, ENV['1028609438162-o0kj0opls5ov0lb7bt0c1rfb5q4btbeo.apps.googleusercontent.com'], ENV['8kPtJTRoa7lgtThBHqMWymU5'],
  # {
  #     name: 'google',
  #     scope: 'email, profile, plus.me, http://gdata.youtube.com',
  #     prompt: 'select_account',
  #     image_aspect_ratio: 'square',
  #     image_size: 50
  #   }
  #   OmniAuth.config.full_host = Rails.env.production? ? 'https://domain.com' : 'http://localhost:3000'
  
  #  provider :google_oauth2, '1028609438162-o0kj0opls5ov0lb7bt0c1rfb5q4btbeo.apps.googleusercontent.com', '8kPtJTRoa7lgtThBHqMWymU5', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}

   provider :google_oauth2, ENV['1028609438162-o0kj0opls5ov0lb7bt0c1rfb5q4btbeo.apps.googleusercontent.com'], ENV['8kPtJTRoa7lgtThBHqMWymU5']
end
