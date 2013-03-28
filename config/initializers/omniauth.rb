Rails.application.config.middleware.use OmniAuth::Builder do
  provider :etsy, Figaro.env.etsy_public_key, Figaro.env.etsy_secret_key, sandbox: true, scope: 'email_r,profile_r,listings_r'
end
