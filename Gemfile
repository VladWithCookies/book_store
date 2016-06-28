source "https://rubygems.org"

  gem "appraisal", ">= 2.0"
  gem "devise", :github => "plataformatec/devise"
  gem "rails", "~> 5.0.0.beta1"
  gem "sass-rails", "~> 5.0"
  gem "rack-pjax", :github => "afcapel/rack-pjax"
  gem "remotipart", :github => "mshibuya/remotipart"
  gem "capybara", :github => "jnicklas/capybara", :group => :test

group :active_record do
  gem "paper_trail", "~> 3.0"

  platforms :jruby do
    gem "activerecord-jdbcmysql-adapter", ">= 1.2"
    gem "jdbc-mysql", ">= 5.1"
    gem "activerecord-jdbcpostgresql-adapter", ">= 1.2"
    gem "jdbc-postgres", ">= 9.2"
    gem "activerecord-jdbcsqlite3-adapter", ">= 1.3.0.beta1"
    gem "jdbc-sqlite3", ">= 3.7"
  end

  platforms :ruby, :mswin, :mingw do
    gem "sqlite3", ">= 1.3"
  end
end

group :development do 
  gem 'listen'
end

group :development, :test do
  gem "pry", ">= 0.9"
  gem "rspec-rails", ">= 2.14"
  gem "factory_girl_rails", ">= 4.2"
  gem "ffaker"
end

group :test do
  gem "carrierwave", ">= 0.8"
  gem "coveralls"
  gem "database_cleaner", [">= 1.2", "!= 1.4.0", "!= 1.5.0"]
  gem "dragonfly", "~> 1.0"
  gem "generator_spec", ">= 0.8"
  gem "launchy", ">= 2.2"
  gem "mini_magick", ">= 3.4"
  gem "paperclip", [">= 3.4", "!= 4.3.0"]
  gem "poltergeist", "~> 1.5"
  gem "pundit"
  gem "rack-cache", :require => "rack/cache"
  gem "simplecov", ">= 0.9", :require => false
  gem "timecop", ">= 0.5"
  gem "shoulda-matchers", "~> 3.1"

  platforms :ruby_19 do
    gem "tins", "~> 1.6.0", :require => false
  end
end

gem 'bootstrap-sass', '~> 3.3.6'
gem 'haml', '~> 4.0.5'
gem 'haml-rails'
gem 'rails_admin', github: 'sferik/rails_admin'
gem 'kaminari'
gem 'bootstrap-kaminari-views'

