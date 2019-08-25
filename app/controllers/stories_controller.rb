class StoriesController < ApplicationController

    get '/stories' do
        authenticate
        @stories = Story.all
        erb :'/stories/index'
    end

    post '/stories' do
        authenticate
        if !params.empty?
            nice_params = cleanse(params)
            @story = Story.create(title: nice_params[:title], content: nice_params[:content], user_id: "#{current_user.id}", story_date: nice_params[:'story_date'])
            if nice_params[:place_id] > "0"
                @place = Place.find_by(id: nice_params[:place_id])
            else nice_params[:place_id] == nil || nice_params[:place_id] == "0"
                @place = Place.find_or_create_by(city: nice_params[:city], state: nice_params[:state], country: nice_params[:country])              
            end
            @story.places << @place
            @story.save
            redirect '/stories'
        end
    end

    get '/stories/new' do
        authenticate
        @places = Place.all
        erb :'/stories/new'
    end

    get '/stories/:id' do 
        authenticate
        nice_params = cleanse(params)
        if @story = Story.all.find_by(id: nice_params[:id]) 
            erb :'/stories/show' 
        else
            redirect 'errors/404'
        end
    end 

    get '/stories/:id/edit' do
        authenticate
        nice_params = cleanse(params)
        @story = Story.find(nice_params[:id])
        auth_user(@story)
        erb :'stories/edit'
    end

    patch '/stories/:id' do
        authenticate
        nice_params = cleanse(params)
        @story = Story.find(nice_params[:id])
        auth_user(@story)
        @story.update(title: nice_params[:title], content: nice_params[:content])
        #@story.places[0] = Place.find_by(id: nice_params[:place_id]) This is for possibly adding the ability to edit the place associated with the story in a future version.  
        redirect "/stories/#{@story.id}"
    end

    delete '/stories/:id' do
        authenticate
        nice_params = cleanse(params)
        @story = Story.find(nice_params[:id])
        auth_user(@story)
        @story.destroy
        redirect '/stories'
    end


end