class TripsController < ApplicationController

  get '/trips' do
    @user = current_user
    @trips = @user.trips
    erb :'/trips/index'
  end

  get '/trips/new' do
    erb :'/trips/new'
  end

  post '/trips' do
    @user = current_user
    # assign user variable to the instance of the current user
    @trip = Trip.create(params["trip"])
    # why is this a string and not a key?
    # assign trip variable to the instance of the new trip using params
    @trip.user = @user
    # assign the user of the trip to the current user
    # can I refactor 2 above lines of code?
    # @user.trips << @trip
    # add the new trip to the trips array for that user (is this already happening?) YES
    redirect to '/trips'
  end

  get '/trips/:id/edit' do
    @trip = Trip.find(params[:id])
    erb :'/trips/edit'
  end

  get '/trips/:id' do
    @trip = Trip.find(params[:id])
    @activities = @trip.activities
    erb :'/trips/show'
  end

  patch '/trips/:id' do

  end

end
