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
    Activity.create(params["activity"])
    redirect to "/trips/#{trip_id}"
    # redirect to the trip page of the trip where the activity was newly added
  end

  get '/activities/:id/edit' do
    @activity = Activity.find(params[:id])
    erb :'/activities/edit'
  end

  patch '/activities/:id' do
    @activity = Activity.find_by_id(params[:id])
    @activity.update(params["activity"])
    trip_id = @activity.trip_id
    redirect to "/trips/#{trip_id}"
  end

  delete '/activities/:id' do
    activity = Activity.find_by_id(params[:id])
    trip_id = activity.trip_id
    activity.delete
    redirect to "/trips/#{trip_id}"
    # redirect to the trip page of the trip where the activity was deleted

  end
end
