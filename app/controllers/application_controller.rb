require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "fwitter"
  end
  get '/' do 
    erb :index
  end
  get "/users/:slug" do 
    @user=User.find_by_slug(params[:slug])
    erb :show
  end
  get '/signup' do 
    if session[:user_id] ==nil 
      erb :signup 
    else 
      redirect to "/tweets" 
    end
  end
  post '/signup' do

      if params[:username]=="" || params[:email]=="" || params[:password]=="" 
         redirect to "/signup" 
      else 
        @user = User.create(:username => params[:username] ,:email => params[:email] , :password => params[:password])
        session[:user_id]=@user.id
        redirect to "/tweets"
     end
  end
  get '/login' do 
    if session[:user_id] ==nil 
      erb :login
    else 
      redirect to "/tweets" 
    end
  end

  post '/login' do 
    user=User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
          session[:user_id] =user.id
          redirect to "/tweets"
    else 
      redirect to "/signup" 
    end
  end
  get '/logout' do 
       session[:user_id] =nil 
       redirect to "/login" 
  end
end