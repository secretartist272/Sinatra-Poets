class PoemsController < ApplicationController

    #index action 
    get '/poems' do
        @poems = Poem.all 

        erb :"/poems/index"
    end
    
    # new action 
    get '/poems/new' do
      erb :"/poems/new"
    end
    
    # create action 
    post '/poems' do
      @poem = Poem.create(:title => params[:title], :content => params[:content])
      redirect to "/poems/#{@poem.id}"
    end
    
    # show action
    get '/poems/:id' do
      @poem = Poem.find_by_id(params[:id])
      erb :"/poems/show"
    end
    
    # edit action
    get '/poems/:id/edit' do
      @poem = Poem.find_by_id(params[:id])
      erb :"/poems/edit"
    end
    
    # update action 
    patch '/poems/:id' do
      @poem = Poem.find_by_id(params[:id])
      @poem.title = params[:title]
      @poem.content = params[:content]
      @poem.save
      redirect to "/poems/#{@poem.id}"
    end
    
    # update action
    # put '/poems/:id' do
      
    # end
    
    # delete action
    delete '/poems/:id' do 
      @poem = Poem.find_by_id(params[:id])
      @poem.delete
      redirect to '/poems'
    end

end