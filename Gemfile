source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.4.0'

gem 'bootstrap-sass', '~> 3.3.6'
gem 'elasticsearch-model'
gem 'elasticsearch-rails'
gem 'rails', '~> 5.0.2'
gem 'will_paginate', '3.1.5'
gem 'will_paginate-bootstrap'
gem 'paperclip'
gem 'devise'
gem 'cancancan'
gem 'rolify'
gem 'pg', '~> 0.19'
gem 'puma', '~> 3.7'
gem 'slim-rails'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

group :development, :test do
  gem 'byebug', platform: :mri
end

group :development do
  gem 'rspec-rails', '~> 3.5'
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
