class PostsController < ApplicationController


    get '/posts' do
        authenticate
        erb :'posts/index'
    end

    get 'posts/index' do
        erb :'post/index'
    end


end