require 'pry'

class SessionController < ApplicationController
    #login
    get '/login' do
        erb :"sessions/new"
    end

    post '/login' do 
        user = User.find_by(username: params[:user][:username])
        
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect to "/users/:id"
        else

            redirect to '/login'
        end
    end

    #logout
    post '/logout' do
        session.clear
        redirect to '/'
    end
end