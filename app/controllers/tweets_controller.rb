class TweetsController < ApplicationController
     
     get '/tweets' do 
     	if session[:user_id]
           erb :'tweets/tweets'
        else 
          redirect to "/login"  

        end 
     end
    get '/tweets/new' do 
       if session[:user_id] 	
          erb :'tweets/new'
        else
          redirect to "/login"  
        end  
 
    end
    post '/tweets/new' do 
        if params[:content] !=""
           @tweet=Tweet.create(:content => params[:content] ,:user_id => session[:user_id]) 
        end
    end
    get '/tweets/:id' do
      if session[:user_id]	!=nil
         @tweet=Tweet.find_by_id(params[:id])
         erb :'tweets/show'
      else
         redirect to "/login"  
      end 
    end
    get '/tweets/:id/edit' do
      if session[:user_id]	!=nil 
         @tweet=Tweet.find_by_id(params[:id])
        if @tweet.user_id==session[:user_id] 
        	erb :'tweets/edit'
        else
        redirect to "/tweets"

        end	
      else
        redirect to "/login"  
      end 
    end
    patch '/tweets/:id' do 
     if params[:content] == ""
      redirect to "/tweets/#{params[:id]}/edit"
     else
      @tweet = Tweet.find_by_id(params[:id])
      @tweet.content = params[:content]
      @tweet.save
      redirect to "/tweets/#{@tweet.id}"
     end
    end
   delete '/tweets/:id/delete' do 
      if session[:user_id]	!=nil 
         @tweet=Tweet.find_by_id(params[:id])
        if @tweet.user_id==session[:user_id] 
        	@tweet.delete
        	redirect to "/tweets"
        else
        redirect to "/tweets"

        end	
      else
        redirect to "/login"  
      end 
  end
end