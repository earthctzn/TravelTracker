class PlacesController < ApplicationController

 

    get '/places' do
        authenticate
        @places = Place.all
        erb :'/places/index'
    end
    post '/places' do
        if !params.empty?
            @place = Place.create(params)
            @user = current_user
            @user.places << @place
            @place.save
            redirect '/places'
        end
    end

    get '/places/new' do
        erb :'/places/new'
    end

    get '/places/:id' do 
        @place = Place.find(params[:id])
        erb :'/places/show'
    end 
end