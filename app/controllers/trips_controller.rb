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
    # assign user to the instance of the current user
    @trip = Trip.create(params["trip"])
    # why is this a string and not a key?
    # assign trip to the newly created trip using params
    @trip.user = @user
    # can I refactor 2 above lines of code?
    @user.trips << @trip
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
