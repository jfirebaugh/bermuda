require 'bundler'
Bundler.require

require 'capybara/cucumber'
require 'capybara/firebug'
require 'bermuda/cucumber'

require 'rack/builder'
require 'rack/file'
require 'rack/directory'

Capybara.configure do |config|
  config.default_driver = :selenium
  config.app = Rack::Builder.app do
    run Rack::Directory.new "features/support/public"
  end
end
