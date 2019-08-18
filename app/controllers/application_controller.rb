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
            redirect 'sessions/home'
        else
            erb :'index'
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
            if !logged_in? || current_user.nil?
                redirect 'sessions/login'
            end
        end

        def auth_user(story)
            if !story || current_user != story.user
            redirect 'sessions/home'
            end
        end

        def cleanse(params)
            nice_params = params.dup
            params.each do |k,v| 
                nice_params[k] = Rack::Utils.escape_html(v)
            end 
            nice_params
        end

        not_found do
            status 404
            erb :'errors/404', layout: false
        end


    end



end