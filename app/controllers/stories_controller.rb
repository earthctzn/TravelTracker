class StoriesController < ApplicationController

    get '/stories' do
        authenticate
        erb :'/stories/index'
    end

    get '/stories/index' do
        erb :'/stories/index'
    end

end