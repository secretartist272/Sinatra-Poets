require 'pry'

class PoemsController < ApplicationController

  #index action 
  get '/poems' do
      @poems = Poem.all 
      erb :"/poems/index"
  end
  
  # new action 
  get '/poems/new' do
    redirect_if_not_logged_in
    erb :"/poems/new"
  end
  
  # create action 
  post '/poems/new' do
    redirect_if_not_logged_in

    if params[:content] != ""
      @poem = Poem.create(content: params[:content], user_id: current_user.id, title: params[:title])
      redirect "/poems/#{@poem.id}"
    else  
      redirect '/poems/new'
    end
  end
  
  # show action
  get '/poems/:id' do
    set_poem
    erb :'/poems/show'
  end
  
  # edit action
  get '/poems/:id/edit' do
    redirect_if_not_logged_in
    set_poem
    
    if authorized_edit?(@poem)
      erb :"/poems/edit"
    else  
      redirect "users/#{current_user.id}"
    end
  end
    
  # update action 
  patch '/poems/:id' do
    redirect_if_not_logged_in
    set_poem

    if @poem.user == current_user && params[:content] != ""
      @poem.update(content: params[:content], title: params[:title])
      redirect to "/poems/#{@poem.id}"
    else 
      redirect "users/#{current_user.id}"
    end
  end
    
   # delete action
  delete '/poems/:id' do 
    
    if logged_in?
      @poem = Poem.find_by_id(params[:id])
      if @poem && @poem.user == current_user
        @poem.delete
        redirect '/poems'
      else
        redirect '/login'
      end
    end
  end

  get "/my_poems" do
    @user = current_user
    @poems = current_user.poem
    
    @poems = @poems.sort_by do |poem|
      poem.title
    end
     
    erb :my_poems
  end

  helpers do 

    def set_poem
      @poem = Poem.find(params[:id])
    end
  end
end