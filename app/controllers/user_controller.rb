class UserController < ApplicationController

    #index actions:
    get '/users' do
        @users = Users.all 

        erb :"/users/index"
    end

    #new user action
    get '/signup' do 
        erb :users/new
    end

    #create users action:
    post '/signup' do
        user = User.new(params["user"])

        if user.save
            session[:user_id] = user.id 
            redirect to "/users"
        else
            @errors = user.errors.full_messages
            erb :"/users/new"
        end
    end

    #show users actions
    get '/users/:id/edit' do
        @user = User.find_by_id(params[:id])

        if @user == current_user
            erb :".user/edit"
        else
            redirect to '/'
        end
    end

    #edit users actions

end