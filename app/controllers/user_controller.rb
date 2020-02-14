class UserController < ApplicationController

    #index actions:
    get '/users' do
        @users = Users.all 

        erb :"/users/index"
    end

    #new user action
    get '/users/new' do 
        erb :users/new
    end

    #create users action:
    post '/users' do
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
    get '/users/:id' do
        @user = User.find_by_id(params[:id])
        erb :"/users/show"
    end

    #edit users actions
    get '/users/:id/edit' do
        @user = User.find_by_id(params[:id])
        erb :"/users/edit"
    end

    #user update action
    patch '/users/:id' do
        @user = User.find_by_id(params[:id])
        if @user.update(params[:user])
            redirect to "/user/#{@user.id}"
        else
            erb :"users/edit"
        end
    end

     #user delete action
     delete '/user/:id' do
        @user = User.find_by_id(params[:id])
        if @user
            @user.destroy
        else
            redirect to "/users"
        end
     end

end