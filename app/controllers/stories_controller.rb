class StoriesController < ApplicationController

    get '/stories' do
        authenticate
        @stories = Story.all
        erb :'/stories/index'
    end

    post '/stories' do
        if !params.empty?
            @story = Story.create(params)
            @story.users = current_user
            @story.save
            redirect '/stories'
        end
    end

    get '/stories/new' do
        authenticate
        erb :'/stories/new'
    end

    get '/stories/:id' do 
        @story = Story.find(params[:id])
        erb :'/stories/show'
    end 

    get '/stories/:id/edit' do
        @story = Story.find(params[:id])
        erb :'stories/edit'
    end

    patch '/stories/:id' do

        @story = Story.find(params[:id])
        @story.update(title: params[:title], content: params[:content])
        redirect "/stories/#{@story.id}"
    end

    delete '/stories/:id' do
        @story = Story.find(params[:id])
        @story.destroy
        redirect '/stories'
    end

end