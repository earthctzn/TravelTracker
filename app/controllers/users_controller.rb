class UsersController < ApplicationController

    get '/users' do
        authenticate
        erb :'users/index'
    end

    get 'users/index' do
        erb :'users/index'
    end


end