source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.3.1'

gem 'rails',                           '~> 5.1.4'
gem 'pg',                              '~> 0.18'
gem 'puma',                            '~> 3.7'
gem 'sass-rails',                      '~> 5.0'
gem 'uglifier',                        '>= 1.3.0'
gem 'coffee-rails',                    '~> 4.2'
gem 'turbolinks',                      '~> 5'
gem 'jbuilder',                        '~> 2.5'
gem 'figaro'  ,                        '~> 1.1'
# Use ActiveModel has_secure_password
# gem 'bcrypt',                        '~> 3.1.7'

# Bootstrap.
gem 'bootstrap',                       '~> 4.0.0.beta'
gem 'jquery-rails',                    '4.3.1'

# Map.
gem "leaflet-rails",                   '~> 1.2'

group :development, :test do
  gem 'faker'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'rubocop-rails'
end

group :test do
  gem 'capybara',                      '~> 2.14'
  gem 'guard',                         '2.14.0'
  gem 'guard-minitest',                '2.4.6'
  gem 'minitest-reporters',            '1.1.14'
  gem 'selenium-webdriver'
  gem 'simplecov', :require => false
end

group :development do
  gem 'web-console',                   '>= 3.3.0'
  gem 'listen',                        '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen',         '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
