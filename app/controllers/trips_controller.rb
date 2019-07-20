class TripsController < ApplicationController

    get '/trips' do
        current_user
        @trips = @user.trips
        erb :'/trips/index'
    end

    get '/trips/new' do
        erb :'/trips/new'
    end

    post '/trips' do
        current_user
        # assign user variable to the instance of the current user
        @trip = Trip.new(params["trip"])
        # assign trip variable to the instance of the new trip using params
        @trip.user = @user
        @trip.save
        # assign the user of the trip to the current user
        redirect to '/trips'
    end

    get '/trips/:id' do
        @trip = Trip.find(params[:id])
        @activities = @trip.activities
        erb :'/trips/show'
    end

    get '/trips/:id/new_activity' do
        @trip = Trip.find(params[:id])
        @user = current_user
        erb :'/activities/new'
    end

    get '/trips/:id/edit' do
        @trip = Trip.find(params[:id])
        erb :'/trips/edit'
    end

    patch '/trips/:id' do
        @trip = Trip.find_by_id(params[:id])
        @trip.update(params["trip"])
        redirect to "/trips"
    end


    delete '/trips/:id' do
        @trip = Trip.find_by_id(params[:id])
        @trip.delete
        redirect to '/trips'
    end

end
