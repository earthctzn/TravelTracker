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
     
    get '/places/:id/edit' do
        @place = Place.find(params[:id])
        erb :'places/edit'
    end

    patch '/places/:id' do
        @place = Place.find(params[:id])
        @place.update(city: params[:city], state: params[:state], country: params[:country], visit_date: params[:'visit_date'])
        redirect "/places/#{@place.id}"
    end

    delete '/places/:id' do
        @place = place.find(params[:id])
        @place.destroy
        redirect '/places'
    end

end