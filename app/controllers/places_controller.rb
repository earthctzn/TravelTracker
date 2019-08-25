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
        if @place = Place.all.find_by(id: nice_params[:id]) 
            erb :'/places/show'
        else
            redirect 'errors/404' 
        end
    end  


end