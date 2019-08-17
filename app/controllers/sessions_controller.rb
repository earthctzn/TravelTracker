class SessionsController < ApplicationController

    get '/login' do
        redirect '/places' if logged_in?
        @failed = false
        erb :'sessions/login'
    end

    post '/login' do 
        @user = User.find_by(username: params[:username])
        if !!@user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect :'/stories'
        else
            @failed = true
            erb :'sessions/login'
        end
    end

    get '/signup' do
        redirect '/stories' if logged_in?
        erb :'sessions/signup'
    end

    post '/signup' do
        # binding.pry
        @user = User.create(params)
        if @user.errors.any?
            erb :"sessions/signup"
        else
            session[:user_id] = @user.id
            redirect :'/stories/new'
        end

    end


    
end