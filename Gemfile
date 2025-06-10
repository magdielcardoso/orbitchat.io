source "https://rubygems.org"

# Rails
gem "rails", "~> 8.0.2"
gem "puma", ">= 5.0"
gem "solid_cable"
gem "tzinfo-data"

# Assets
gem "propshaft"

# Server & Infra
gem "bootsnap", require: false
gem 'dotenv-rails'
gem "thruster", require: false
gem "lograge"

# Cache and Queue
gem 'redis'
gem 'sidekiq'
gem 'sidekiq-cron'

# Deployment
gem "kamal", require: false

# Database
gem "pg"
gem 'goldiloader'

# Authentication & Authorization
gem "devise", "~> 4.9"
gem 'pundit'

# API
gem "jbuilder"

# Frontend
gem "inertia_rails", "~> 3.8"
gem "vite_rails", "~> 3.0"
gem "tailwindcss-rails"

# Admin dashboard
gem "administrate"

# State machine
gem "aasm"

group :development, :test do
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
  gem 'byebug'
end

group :development do
  gem "web-console"
  gem 'bullet'
  gem 'rack-mini-profiler', require: false
  gem 'rails_db'
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "database_cleaner-active_record"
  gem "minitest-reporters"
  gem 'simplecov', require: false
end
