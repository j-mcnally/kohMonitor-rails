# Load the rails application
require File.expand_path('../application', __FILE__)

require ::File.expand_path('setenv.rb') if !::File.file?(File.expand_path('.rvmrc'))

# Initialize the rails application
Kohdr::Application.initialize!