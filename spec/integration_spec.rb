require('rspec')
require('capybara')
require('pry')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)
