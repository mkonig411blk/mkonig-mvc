class ActivitiesController < ApplicationController

  get '/activities' do
    @activities = Activity.all
    erb :'/activities/index' 
  end

  get '/activities/new' do 
    @trips = Trip.all
    erb :'/activities/new'
  end

  post '/activities' do 
 @activity = Activity.create(params[:activity])
      if !params["trip"]["name"].empty?
        @trip.activities << Activity.create(name: params["activity"]["name"])
      end
    redirect "activities/#{@activity.id}"
  end

  get '/activities/:id' do 
    @activity = Activity.find(params[:id])
    erb :'/activities/show'
  end

  patch '/activities/:id' do 

    redirect to "activities/#{@activity.id}"
  end
end