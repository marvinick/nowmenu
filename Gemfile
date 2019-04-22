source 'https://rubygems.org'

ruby '2.6.1'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.2.0'
gem 'bootsnap'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'draftsman', '~> 0.7.1'

#roles
gem "pundit"
gem 'name_of_person'

#faster app
gem 'redis', '~> 4.0'
gem 'sidekiq'
gem 'goldiloader'
gem 'kaminari'
gem 'actionpack-action_caching'

gem 'bullet', group: 'development'

#data analysis
gem "daru", git: 'https://github.com/SciRuby/daru.git'
gem 'nyaplot', git: 'https://github.com/sciruby/nyaplot.git'
gem 'daru-data_tables', git: 'https://github.com/shekharrajak/daru-data_tables.git'
gem 'google_visualr', git: 'https://github.com/winston/google_visualr.git'
gem 'daru-view', git: 'https://github.com/SciRuby/daru-view.git'
gem 'eps'

#forms
gem 'simple_form'

#activity
gem 'public_activity'

#search
gem 'ransack'
gem 'webpacker', git: 'https://github.com/rails/webpacker.git'

#authentication
gem 'devise'
gem 'devise_invitable'

#draggable sortable
gem 'jquery-ui-rails'
gem 'acts_as_list'

#frontend
gem 'rails-hyperstack'

#animation
gem 'animate.css-rails', '~> 3.2.0'

#image upload
gem 'aws-sdk'
gem "aws-sdk-s3", require: false
gem "mini_magick"

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara'
  gem 'selenium-webdriver'
  gem "rspec-rails", "~> 3.7.0"
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'cucumber-rails', require: false
  # database_cleaner is not required, but highly recommended
  gem 'database_cleaner'
  gem 'factory_bot_rails'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
