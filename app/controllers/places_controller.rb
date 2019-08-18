class PlacesController < ApplicationController

    get '/places' do
        authenticate
        @user = current_user
        @places = Place.all
        erb :'/places/index'
    end

    get '/places/:id' do
        authenticate 
        nice_params = cleanse(params)  
        @place = Place.find(nice_params[:id])
        if !Place.all.include?(@place) 
            redirect 'errors/404'
        else
            erb :'/places/show'
        end
    end  


end