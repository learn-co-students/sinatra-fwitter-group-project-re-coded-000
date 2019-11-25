class TweetsController < ApplicationController
  get '/tweets' do
    if logged_in? then
      @tweets = Tweet.all
    erb :'tweets/tweets'
    else
      redirect '/login'
    end
  end

  get '/tweets/new' do
    if logged_in? then
      erb :'tweets/create_tweet'
    else
      redirect '/login'
    end
  end

post '/tweets' do
  if params[:content] == "" then
    redirect '/tweets/new'
  else
    @tweet = Tweet.create(:content => params[:content], :user_id => current_user.id)
    redirect "tweets/#{@tweet.id}"
  end
end

get '/tweets/:id' do
  if logged_in? then
    @tweet = Tweet.find_by_id(params[:id])
    erb :'tweets/show_tweet'
  else
    redirect '/login'
  end
end

get '/tweets/:id/edit' do
  if logged_in? then
    @tweet = Tweet.find(params[:id])
    if @tweet.user_id == session[:user_id]
    erb :'tweets/edit_tweet'
  else
    redirect '/tweets'
  end
  else
    redirect '/login'
  end
end

patch '/tweets/:id' do
  @tweet = Tweet.find(params[:id])
  if params[:content] == ""
     redirect to "/tweets/#{params[:id]}/edit"
   else
     @tweet.update(content:params[:content])
     @tweet.save
     redirect to "/tweets/#{@tweet.id}"
   end
end

delete '/tweets/:id/delete' do
   @tweet = Tweet.find_by_id(params[:id])
   if session[:user_id]
     @tweet = Tweet.find_by_id(params[:id])
     if @tweet.user_id == session[:user_id]
       @tweet.delete
       redirect to '/tweets'
     else
       redirect to '/tweets'
     end
   else
     redirect to '/login'
   end
 end


end
