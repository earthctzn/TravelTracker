class ApplicationController < Sinatra::Base

    configure do
        set :views, 'app/views'
        set :public_folder, 'public'
        enable :sessions
        set :session_secret, SESSION_SECRET
    end

    get '/' do
        erb :index
    end

    get '/index' do
        erb :'/index'
    end

    get '/home' do
        authenticate
        @user = current_user
        if !@user
            redirect :'/home'
        else
            erb :home
        end
    end 

    helpers do
        
        def logged_in?
            !!session[:user_id]
        end

        def current_user
           User.find_by(id: session[:user_id])
        end

        def authenticate
            if !logged_in?
                redirect :'/login'
            end
        end

        def auth_user(story)
            redirect '/index' if !story
            redirect '/index' if current_user != story.user
        end
   

    end



end