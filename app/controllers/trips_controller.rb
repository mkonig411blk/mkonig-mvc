class TripsController < ApplicationController

  get '/trips' do
    @trips = Trip.all
    erb :'/trips/index'
  end

  get '/trips/new' do
    erb :'/trips/new'
  end

  post '/trips' do

  end

  get '/trips/:id/edit' do
    @trip = Trip.find(params[:id])
    erb :'/trips/edit'
  end

  get '/trips/:id' do
    @trip = Trip.find(params[:id])
    erb :'/trips/show'
  end

  patch '/trips/:id' do

  end
end
