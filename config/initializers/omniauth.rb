Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '779951755143-gk596fbq9pea98ikak3lfs6c6v5f6vbc.apps.googleusercontent.com', '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'
end