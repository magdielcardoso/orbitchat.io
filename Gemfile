source "https://rubygems.org"

# Rails & Infra
gem "rails", "~> 8.0.2"
gem "propshaft"
gem "puma", ">= 5.0"
gem "jbuilder"
gem "bootsnap", require: false
gem "kamal", require: false
gem "thruster", require: false
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"
gem "tzinfo-data", platforms: %i[ windows jruby ]

# Database
gem "pg"

# Authentication
gem "devise", "~> 4.9"

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
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "database_cleaner-active_record"
  gem "minitest-reporters"
end



