source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Lock ruby version
#------------------------------------------------------------------------------
ruby '2.4.2'

# System (core gems)
#------------------------------------------------------------------------------
gem 'rails', '~> 5.1.4'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'

# Javascripts
#------------------------------------------------------------------------------
gem 'coffee-rails', '~> 4.2'

# Markup (sass useless because of yarn)
#------------------------------------------------------------------------------
gem 'sass-rails', '~> 5.0'
gem 'slim'

# Tools
#------------------------------------------------------------------------------
gem 'uglifier', '>= 1.3.0'
gem 'jbuilder', '~> 2.5'

# Locales
#------------------------------------------------------------------------------
gem 'russian'

# Only for development
#------------------------------------------------------------------------------
group :development do
  gem 'better_errors'
  gem 'pry-rails'
  gem 'annotate'
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Only for production
#------------------------------------------------------------------------------
group :production do
  # gem 'unicorn'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
