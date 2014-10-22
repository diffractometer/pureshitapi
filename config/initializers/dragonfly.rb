require 'dragonfly'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  secret "913ee673b777d6f581f9ed6aa1b40590949ced6742eb5383f9c428275e06b7e2"

  url_format "/media/:job/:name"
 
  # to activate local storage   
  # datastore :file,
    # root_path: Rails.root.join('public/system/dragonfly', Rails.env),
    # server_root: Rails.root.join('public')
  
  datastore :s3,
    bucket_name:       'pureshit-production-uploads',
    access_key_id:     Rails.application.secrets.aws_key,
    secret_access_key: Rails.application.secrets.aws_secret,
    url_scheme:        'https',
    server_root:       'uploads',
    root_path:         'uploads'
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Dragonfly::Model
  ActiveRecord::Base.extend Dragonfly::Model::Validations
end
