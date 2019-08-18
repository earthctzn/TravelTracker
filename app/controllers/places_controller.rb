class PlacesController < ApplicationController

    get '/places' do
        authenticate
        @user = current_user
        @places = Place.all
        erb :'/places/index'
    end

    get '/places/:id' do
        authenticate 
        if !Place.all.include?(params[:id]) 
            redirect 'errors/404'
        else
            nice_params = cleanse(params)  
            @place = Place.find(nice_params[:id])
            erb :'/places/show'
        end
    end  


end