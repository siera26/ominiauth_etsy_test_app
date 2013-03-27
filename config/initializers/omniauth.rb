Rails.application.config.middleware.use OmniAuth::Builder do
  provider :etsy, YOUR_PUBLIC_KEY, YOUR_SECRET_KEY, sandbox: true
end