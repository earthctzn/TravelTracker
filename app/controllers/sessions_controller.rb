class SessionsController < ApplicationController

    get '/login' do
        redirect '/posts' if logged_in?
        @failed = false
        erb :'sessions/login'
    end

    post '/login' do 
        user = User.find_by(username: params[:username])
        if !!user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect :'posts/index'
        else
            @failed = true
            erb :'sessions/login'
        end
    end

    get '/signup' do
        redirect '/posts' if logged_in?
        erb :'sessions/signup'
    end

    post '/signup' do
        @user = User.create(params)
        session[:user_id] = @user.id
        redirect :'posts/index'

    end


    
end