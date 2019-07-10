# require "./config/environment"
# require "./app/models/user"
class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }
  
  # configure do
  #   set :views, "app/views"
  #   enable :sessions
  #   set :session_secret, "password_security"
  # end
  
  get '/' do
    erb :home
  end
  
end