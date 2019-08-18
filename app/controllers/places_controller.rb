class PlacesController < ApplicationController

    get '/places' do
        authenticate
        @places = Place.all
        erb :'/places/index'
    end

    # post '/places' do # I have to reavaluate if this is necessary anymore.
    #     nice_params = cleanse(params)
    #     if !params.empty?
    #         @place = Place.create(nice_params)
    #         redirect '/places'
    #     end
    # end

    # get '/places/new' do
    #     erb :'/places/new'
    # end

    get '/places/:id' do
        authenticate 
        nice_params = cleanse(params)  
        @place = Place.find(nice_params[:id])
        erb :'/places/show'
    end
     
    # get '/places/:id/edit' do
    #     nice_params = cleanse(params)
    #     @place = Place.find(nice_params[:id])
    #     erb :'places/edit'
    # end

    # patch '/places/:id' do
    #     nice_params = cleanse(params)
    #     @place = Place.find(params[:id])
    #     @place.update(city: nice_params[:city], state: nice_params[:state], country: nice_params[:country], visit_date: nice_params[:'visit_date'])
    #     redirect "/places/#{@place.id}"
    # end

    # delete '/places/:id' do
    #     nice_params = cleanse(params)
    #     @place = Place.find(nice_params[:id])
    #     @place.destroy
    #     redirect '/places'
    # end

end