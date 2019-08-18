class UsersController < ApplicationController

    get '/logout' do
        session.clear
        redirect '/index'
    end

end