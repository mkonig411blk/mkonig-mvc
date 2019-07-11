class UsersController < ApplicationController

 get "/signup" do
    erb :signup
  end

  post "/signup" do
    user = User.new(:email => params[:email], :password => params[:password])
    if user.save
      session[:user_id] = user.id # Need to ensure user is logged in when redirected to trips/index.erb. Does this work?
      redirect "/trips"
    else
      redirect "/failure"
    end
  end
  # Because our user has has_secure_password, we won't be able to save this to the database unless our user filled out the password field. Calling user.save will return false if the user can't be persisted. If the user is saved, we redirect to "/trips". If user can't be saved, we redirect to "/failure". However I've added html to prevent users from submitted without filling out both fields, so no user should hit the failure page.

  get "/login" do
    erb :login
  end

  post "/login" do
    user = User.find_by(:email => params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/trips"
    else
      redirect "/failure"
    end
  end

  get "/failure" do
    erb :failure
  end

  get "/logout" do
    session.clear
    redirect "/"
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
  end

end
