# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!


require 'casclient'
require 'casclient/frameworks/rails/filter'

CASClient::Frameworks::Rails::Filter.configure(
  :cas_base_url => "https://cas.tamu.edu/cas",
  :login_url => "https://cas.tamu.edu/cas/login",
  :username_session_key => :cas_user
)
