source 'https://rubygems.org' # RubyGems.org is the Ruby community’s gem hosting service
ruby '2.3.0' # https://www.ruby-lang.org/en/documentation/

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# ==============================================================================
# Frameworks & Core Dependencies ===============================================
# ==============================================================================
gem 'jbuilder', '~> 2.5' # build JSON APIs: https://github.com/rails/jbuilder
gem "pg", "<= 1.1.3" # pg is the Ruby interface to the {PostgreSQL RDBMS}
gem 'puma', '~> 3.11' # A Ruby/Rack web server built for concurrency
gem 'rails', '~> 5.2.2' # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'

# ==============================================================================
# Languages/Interpreters/Compilers/Compressors =================================
# ==============================================================================
gem 'coffee-rails', '~> 4.2' # CoffeeScript adapter for the Rails asset pipeline
gem 'sass-rails', '~> 5.0' # Ruby on Rails stylesheet engine for Sass
gem 'uglifier', '>= 1.3.0' # Ruby wrapper for UglifyJS JavaScript compressor

# ==============================================================================
# Admin ========================================================================
# ==============================================================================
gem 'bootsnap', '>= 1.1.0', require: false # reduces boot times through caching
# gem "rails-settings-cached", "~> 0.7.1" # manage settings with Ruby on Rails
# gem "rollbar", "~> 2.18.0" # exception tracking and logging from Ruby to Rollbar
gem 'snoop_dogg', '~> 0.1.3' # A nicer way to see models
gem 'turbolinks', '~> 5' # navigate application faster: github.com/turbolinks/turbolinks
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby] # for zoneinfo files with Windows

# ==============================================================================
# Authentication & Authorization ===============================================
# ==============================================================================
gem "devise", "~> 4.5.0" # flexible authentication solution for Rails with Warden
gem "devise-bootstrap-views", "~> 1.1.0" # Devise Bootstrap views with i18n support
gem "pundit", "~> 2.0.0" # minimal authorization through OO design and pure Ruby classes
# gem "recaptcha", "~> 4.12.0", require: "recaptcha/rails" # ReCaptcha helpers for ruby apps

# ==============================================================================
# Assets =======================================================================
# ==============================================================================
gem "bootstrap-sass", "~> 3.3.7" # official Sass port of Bootstrap 2 and 3
gem 'bootstrap-select-rails' # assets for bootstrap-select
gem "font-awesome-rails", "~> 4.7.0.4" # font-awesome for asset pipeline
gem "jquery-rails", "~> 4.3.3" # automate using jQuery with Rails
gem "jquery-ui-rails", "~> 6.0.1" # jQuery UI for the Rails asset pipeline
gem "js_cookie_rails", "~> 2.2.0" # adds js-cookie to the Rails asset pipeline
# gem 'react-rails' # adds React.js to asset pipeline

# ==============================================================================
# Forms ========================================================================
# ==============================================================================
# gem "cocoon", "~> 1.2.11" # for dynamic nested forms using jQuery
# gem "trix", "~> 0.11.1" # rich text editor for everyday writing

# ==============================================================================
# File Reading, Uploading, And Generation ======================================
# ==============================================================================
# gem "roo", "~> 2.7.0" # provides an interface to spreadsheets of several sorts
# gem "wicked_pdf", "~> 1.1" # PDF generator (from HTML) plugin for Ruby on Rails
# gem 'wkhtmltopdf-binary' # provides binaries for WKHTMLTOPDF project

# ==============================================================================
# Integratons ==================================================================
# ==============================================================================
# gem "delayed_job_active_record", "~> 4.1.3" # ActiveRecord backend integration for DelayedJob 3.0+
# gem "fog", "~> 2.0.0" # cloud services library
# gem 'friendly_id', '~> 5.1.0' # create pretty URLs with human-friendly strings
# gem "i18n", "~> 0.7" # internationalization (i18n) library for Ruby
# gem "paper_trail", "~> 10.0.1" # track changes to your rails models

# ==============================================================================
# Searching/Sorting ============================================================
# ==============================================================================
# gem "search_cop", "~> 1.0.9" # search engine like fulltext query support for ActiveRecord
# gem "smart_listing", "~> 1.2.2" # data listing gem with built-in sorting, filtering and in-place editing

# ==============================================================================
# APIs & Integratons ===========================================================
# ==============================================================================
# gem "aws-sdk-mturk", "~> 1.6.0" # integrates the AWS SDK for Ruby with Ruby on Rails
# gem 'intercom', '~> 3.7.2' # Ruby bindings for the Intercom API
# gem "intercom-rails", "~> 0.4.0" # customer relationship management/messaging
# gem 'oauth2', "~> 1.4.1" # wrapper for the OAuth 2.0 protocol


group :development do
  # gem 'annotate', '~> 2.7', '>= 2.7.1' # annotates routes & fixtures based on schema
  gem "better_errors", "~> 2.5.0" # better error page for Rack apps
  # gem 'letter_opener', '~> 1.4', '>= 1.4.1' # open email in the browser when send event triggered
  gem 'listen', '>= 3.0.5', '< 3.2' # listens to file modifications and notifies you about the changes
  gem 'spring' # Rails application preloader
  gem 'spring-watcher-listen', '~> 2.0.0' # watch filesystem for changes without polling
  gem 'web-console', '>= 3.3.0' # interactive console for exception pages
end


group :test do
  # gem "database_cleaner", "~> 1.7.0" # used to ensure a clean state for testing
  gem 'capybara', '>= 2.15' # test framework for web applications
  gem 'chromedriver-helper' # to run system tests with Chrome
  gem 'selenium-webdriver' # browser automation framework and ecosystem
end


group :development, :test do
  gem "dotenv-rails", "~> 2.5.0" # autoload dotenv in Rails
  gem "better_errors", "~> 2.5.0" # better error page for Rack apps
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw] # a debugger console
  # gem "factory_bot_rails", "~> 4.11.1" # library for setting up Ruby objects as test data
  # gem "rails-controller-testing", "~> 1.0.2" # brings back `assigns` and `assert_template` to your Rails tests
  # gem "rspec_junit_formatter", "~> 0.4.1" # RSpec results that your CI can read
  # gem "rspec-rails", "<= 3.8.0" # RSpec for Rails-3+
end

group :production, :acceptance do
  gem "rack-timeout", "~> 0.5.1" # abort requests that are taking too long
end
