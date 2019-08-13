class PlacesController < ApplicationController

 

    get '/places' do
        authenticate
        @places = Place.all
        erb :'/places/index'
    end
    get '/places/new' do
        erb :'/places/new'
    end

    get 'places/index' do
        erb :'/places/index'
    end



    post '/places' do
        if !params.empty?
         @place = Place.create(params)
         redirect "/places/#{@place.id}"
        end

    end

    get '/places/:id' do 
        binding.pry
        @place = Place.find()
        erb :'/places/show'
    end 
end