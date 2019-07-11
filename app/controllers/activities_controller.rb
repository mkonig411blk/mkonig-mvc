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
    @trip =
    # why is this a string and not a key?
    @trip.activities << Activity.create(params["activity"])
    redirect to "/trips"
    # redirect to the all trips page after adding a new activity


    # @user = current_user
    # # assign user to the instance of the current user
    # @trip = Trip.create(params["trip"])
    # # why is this a string and not a key?
    # # assign trip to the newly created trip using params
    # @trip.user = @user
    # # can I refactor 2 above lines of code?
    # @user.trips << @trip
    # redirect to '/trips'
  end

  get '/activities/:id' do
    @activity = Activity.find(params[:id])
    erb :'/activities/show'
  end

  patch '/activities/:id' do
    redirect to "activities/#{@activity.id}"
  end
end
