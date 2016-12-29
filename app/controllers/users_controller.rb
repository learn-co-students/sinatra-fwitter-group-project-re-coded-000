class UsersController < ApplicationController
  get '/signup' do
    if !logged_in? then
    erb :'users/create_user', locals: {message: "Please sign up before you sign in"}
  else
    redirect '/tweets'
  end
  end

  post '/signup' do
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      redirect to '/signup'
    else
      @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
      @user.save
      session[:user_id] = @user.id
      redirect to '/tweets'
    end
  end

  get '/login' do
    if logged_in? then
      redirect '/tweets'
    else
      erb :'users/login'
    end
  end

  post '/login' do
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/tweets"
    else
      redirect '/signup'
    end
  end

  get '/logout' do
    if logged_in? then
      session.destroy
      redirect to '/login'
    else
      redirect to '/'
    end
  end

  get '/users/:slug' do
   @user = User.find_by_slug(params[:slug])
   erb :'users/show'
 end

end
