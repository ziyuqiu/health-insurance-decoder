source 'https://rubygems.org'
ruby "2.4.1"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails',          '~> 5.1.4'
gem 'bcrypt'
gem 'faker'
gem 'carrierwave',    '1.1.0'
gem 'mini_magick',    '4.7.0'
gem 'fog',            '1.40.0'
gem 'paperclip',      '~> 3.0'
gem 'minitest'
gem 'bootstrap-sass', '3.3.7'
gem 'puma',           '~> 3.7'
gem 'sass-rails',     '~> 5.0'
gem 'uglifier',       '>= 1.3.0'
gem 'coffee-rails',   '~> 4.2'
gem 'turbolinks',     '~> 5'
gem 'jbuilder',       '~> 2.5'
gem 'json'
gem 'awesome_print'
gem 'will_paginate'
gem 'bootstrap-will_paginate'
gem 'jquery'
gem 'jquery-rails'
gem 'pg_search'
gem 'binding_of_caller'
gem 'rails-controller-testing'
gem 'simple_form'
gem 'rails-admin'
gem 'simple_calendar'
gem 'bootstrap-select-rails'
gem 'webpush'
gem 'pushpad'
gem 'gmaps4rails'

#google login API
gem "omniauth-google-oauth2", "~> 0.2.1"
group :development, :test do
  gem 'sqlite3', '1.3.13'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'minitest-reporters'
  gem 'guard'
  gem 'guard-minitest'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'activerecord-import'
  gem "better_errors"
  gem "pry-rails"
end

group :production do
  gem 'pg', '0.20.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
