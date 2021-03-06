class SessionsController < ApplicationController
    get '/sessions/home' do
        erb :'sessions/home'
    end

    get '/sessions/login' do
        erb :'/sessions/login'
    end

    get '/login' do
        if logged_in?
            @failed = false
            redirect '/stories' 
        else 
            erb :'sessions/login'
        end
    end

    post '/login' do
        nice_params = cleanse(params)
        @user = User.find_by(username: nice_params[:username])
        if !!@user && @user.authenticate(nice_params[:password])
            session[:user_id] = @user.id
            redirect :'sessions/home'
        else
            @failed = true
            erb :'sessions/login'
        end
    end

    get '/logout' do
        session.clear
        redirect '/index'
    end

    get '/signup' do
        if logged_in?
            redirect '/stories'  
        else
            erb :'sessions/signup'
        end
    end

    post '/signup' do
        nice_params = cleanse(params)
        @user = User.create(nice_params)
        if @user.errors.any?
            erb :"sessions/signup"
        else
            session[:user_id] = @user.id
            redirect :'/stories/new'
        end

    end


    
end