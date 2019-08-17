class StoriesController < ApplicationController

    get '/stories' do
        authenticate
        @stories = Story.all
        erb :'/stories/index'
    end

    post '/stories' do
        authenticate
        if !params.empty?
            #binding.pry
            @story = Story.create(title: params[:title], content: params[:content])
            @story.user = current_user
            @place = Place.create(city: params[:city], state: params[:state], country: params[:country], visit_date: params[:'visit_date'])
            @story.places << @place
            @story.save
            redirect '/stories'
        end
    end

    get '/stories/new' do
        authenticate
        erb :'/stories/new'
    end

    get '/stories/:id' do 
        authenticate
        @story = Story.find(params[:id])
        
        #binding.pry
        erb :'/stories/show'
    end 

    get '/stories/:id/edit' do
        authenticate
        auth_user(@story)
        @story = Story.find(params[:id])
        erb :'stories/edit'
    end

    patch '/stories/:id' do
        authenticate
        @story = Story.find(params[:id])
        @story.update(title: params[:title], content: params[:content])
        redirect "/stories/#{@story.id}"
    end

    delete '/stories/:id' do
        authenticate
        @story = Story.find(params[:id])
        @story.destroy
        redirect '/stories'
    end


end