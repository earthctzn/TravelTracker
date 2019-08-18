class PlacesController < ApplicationController

 

    get '/places' do
        authenticate
        nice_params = nope(params)
        @places = Place.all
        erb :'/places/index'
    end
    # post '/places' do # I have to reavaluate if this is necessary anymore.
    #     if !params.empty?
    #         @place = Place.create(params)
    #         redirect '/places'
    #     end
    # end

    # get '/places/new' do
    #     erb :'/places/new'
    # end

    get '/places/:id' do
        authenticate 
        nice_params = nope(params)  
        @place = Place.find(nice_params[:id])
        erb :'/places/show'
    end
     
    # get '/places/:id/edit' do
    #     @place = Place.find(params[:id])
    #     erb :'places/edit'
    # end

    # patch '/places/:id' do
    #     @place = Place.find(params[:id])
    #     @place.update(city: params[:city], state: params[:state], country: params[:country], visit_date: params[:'visit_date'])
    #     redirect "/places/#{@place.id}"
    # end

    # delete '/places/:id' do
    #     @place = Place.find(params[:id])
    #     @place.destroy
    #     redirect '/places'
    # end

end