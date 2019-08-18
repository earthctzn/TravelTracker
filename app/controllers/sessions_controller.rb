class SessionsController < ApplicationController

    get '/login' do
        redirect '/home' if logged_in?
        @failed = false
        erb :'sessions/login'
    end

    post '/login' do
        @user = User.find_by(username: nice_params[:username])
        if !!@user && @user.authenticate(nice_params[:password])
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
        #binding.pry
        @user = User.create(nice_params)
        if @user.errors.any?
            erb :"sessions/signup"
        else
            session[:user_id] = @user.id
            redirect :'/stories/new'
        end

    end


    
end