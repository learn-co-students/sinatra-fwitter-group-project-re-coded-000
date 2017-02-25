class UsersController < ApplicationController

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'users/show'
  end


  get '/signup' do

      redirect to '/tweets'
  end

  post '/signup' do 
      @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
      @user.save
      session[:user_id] = @user.id
      redirect to '/tweets'
    end
  end

  get '/login' do 
      redirect '/tweets'

  end

  post '/login' do
    user = User.find_by(:username => params[:username])
    if user 
      redirect "/tweets"
    else
      redirect to '/signup'
    end
  end

  get '/logout' do
    
      session.destroy
      redirect to '/login'
    
  end



end