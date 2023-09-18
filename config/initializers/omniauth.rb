OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer if Rails.env.development?
  provider :twitter2, ENV["TWITTER_CLIENT_ID"], ENV["TWITTER_CLIENT_SECRET"], callback_path: '/auth/twitter2/callback', scope: "tweet.read users.read"
  provider :twitch, client_id: ENV["TWITCH_CLIENT_ID"], client_secret: ENV["TWITCH_CLIENT_SECRET"], redirect_uri: 'http://localhost:3000/auth/twitch/callback', response_type: 'code', scope: 'user:read:follows'
end

OmniAuth.config.allowed_request_methods = [:post, :get] if Rails.env.development?