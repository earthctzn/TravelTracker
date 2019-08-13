class PlacesController < ApplicationController


    get '/places' do
        authenticate
        erb :'places/index'
    end

    get 'places/index' do
        erb :'places/index'
    end


end