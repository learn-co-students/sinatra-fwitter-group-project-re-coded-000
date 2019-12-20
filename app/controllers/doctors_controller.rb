class DoctorsController < ApplicationController

  get '/doctors' do 
    if !session[:user_id]
      
       erb :'users/create_user', locals: {message: "Please sign up before you sign in"}
    else
      @doctors=Doctor.all
      erb :'doctors/doctors'
    end
  end

  get '/doctors/new' do
    if session[:user_id]
      erb :'doctors/create_doctor'
    else
      redirect to '/login'
    end
  end

  post '/doctors' do
    if params[:name] == ""
      redirect to "/doctors/new"
    else
      @doctor = Doctor.create(:name => params[:name], :department => params[:department], :email=>params[:email], :password_digest=>params[:password_digest])
      redirect to "/doctors/#{@doctor.id}"
    end
  end

  get '/doctors/:id' do 
    if session[:user_id]
      @doctor = Doctor.find_by_id(params[:id])
      erb :'doctors/show_doctor'
    else 
      redirect to '/login'
    end
  end

  get '/doctors/:id/edit' do
    if session[:user_id] 
       @doctor = Doctor.find_by_id(params[:id])
       erb :'doctors/edit_doctor'
    else
      redirect to '/login'
    end
  end

  patch '/doctors/:id' do 
    if params[:name] == ""
      redirect to "/doctors/#{params[:id]}/edit"
    else
      @doctor = Doctor.find_by_id(params[:id])
      @doctor.name = params[:name]
      @doctor.department = params[:department]
      @doctor.email = params[:email]
      @doctor.password_digest = params[:password_digest]
      @doctor.save
      redirect to "/doctors/#{@doctor.id}"
    end
  end

  end