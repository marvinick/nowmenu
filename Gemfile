source 'https://rubygems.org'

ruby '2.6.1'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# gem 'rails', '~> 5.2.3'
gem 'rails', '~> 6.0.0.rc1'
gem 'bootsnap'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'

#roles
gem "pundit"
gem 'name_of_person'

#faster app
gem 'redis'
gem 'sidekiq'
gem 'kaminari'
gem 'actionpack-action_caching'

#data analysis
gem "daru", git: 'https://github.com/SciRuby/daru.git'
gem 'eps', require: false
gem 'chartkick'
gem 'groupdate'

#forms
gem 'simple_form'

#search
gem 'ransack'
gem 'webpacker'

#authentication
gem 'devise'
gem 'devise_invitable'

#draggable sortable
gem 'jquery-ui-rails'
gem 'acts_as_list'


#image upload
gem "aws-sdk-s3"
gem "mini_magick"

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara'
  gem 'selenium-webdriver'
  gem "rspec-rails"
end

group :development do
  gem 'web-console'
  gem 'listen'
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'bullet'
end

group :test do
  gem 'cucumber-rails'
  # database_cleaner is not required, but highly recommended
  gem 'database_cleaner'
  gem 'factory_bot_rails'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
