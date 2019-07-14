class ActivitiesController < ApplicationController

  get '/activities' do
    @activities = Activity.all
    erb :'/activities/index'
  end

  get '/activities/new' do
    @user = current_user
    @trips = @user.trips
    erb :'/activities/new'
  end

  post '/activities' do
    trip_id = params["activity"]["trip_id"]
    # I want to grab their input from the dropdown- how? is it trip.id? does this happen automatically?
    # why is this a string and not a key?
    Activity.create(params["activity"])
    redirect to "/trips/#{trip_id}"
    # redirect to the all trips page after adding a new activity
  end

  get '/activities/:id' do
    @activity = Activity.find(params[:id])
    erb :'/activities/show'
  end

  patch '/activities/:id' do
    redirect to "activities/#{@activity.id}"
  end
end
