class SessionController < ApplicationController
    #login
    get '/login' do
        erb :"sessions/new"
    end

    post '/login' do 
        user = User.find_by(username: params[:user][:username])

        if user && user.authenticate(params[:user][:username])
            session[:user_id] = user.user_id
            redirect to "/users/#{user.id}"
        else
            
        end
    end

    #logout
    post '/logout' do
        session.clear
        redirect to '/'
    end
end