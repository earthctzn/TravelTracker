class SessionsController < ApplicationController

    get '/login' do
        erb :'sessions/login'
    end

    post '/login' do 
      if  user = User.find_by(username: params[:username])
        session[:user_id] = user.id
        redirect :'/index'
      else
        erb :'sessions/login'
      end
    end

    get '/signup' do
        erb :'sessions/signup'
    end


    
end