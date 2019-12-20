class UsersController < ApplicationController
  

  get '/signup' do
    if !session[:user_id]
      erb :'users/create_user', locals: {message: "Please sign up before you sign in"}
    else
      redirect to '/'
    end
  end

  post '/signup' do 
    if params[:username] == "" || params[:email] == "" || params[:password_digest] == ""
      redirect to '/signup'
    else
      @user = User.new(:username => params[:username], :email => params[:email], :password_digest => params[:password])
      @user.save
      session[:user_id] = @user.id
      redirect to '/'
    end
  end

  get '/login' do 
    if !session[:user_id]
      erb :'users/login'
    else
      redirect '/doctors'
    end
  end

  post '/login' do
    user = User.find_by(:username => params[:username])
    if user #&& user.authenticate(params[:password_digest])
      session[:user_id] = user.id
      redirect "/"
    else
      redirect to '/signup'
    end
  end

  get '/logout' do
    if session[:user_id] != nil
      session.destroy
      redirect to '/login'
    else
      redirect to '/'
    end
  end




end