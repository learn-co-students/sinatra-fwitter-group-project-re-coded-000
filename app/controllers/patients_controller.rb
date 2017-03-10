class PatientsController < ApplicationController

#   get '/patients' do 
#     @patients = Patient.all
#   end

#   get '/patients/:id' do 

#     if session[:user_id]
#       @patient=Patient.find_by_id(params[:id])
#       erb :'patients/show'
#     else 
#       redirect to '/login'
#     end
#   end

#   get '/patients/new' do
#     if session[:user_id]
#       erb :'patients/create'
#     else
#       redirect to '/login'
#     end
#   end

# post '/patients' do
#     if params[:name] == ""
#       redirect to "/patients/new"
#     else
#       @patient = current_user #Patient.create(:name => params[:name], :email=>params[:email], :password_digest=>params[:password_digest],:age=>params[:age])
#       @patient.save
#       redirect to "/patients/#{@patient.id}"
#     end
#   end

#   get '/patients/:id/edit' do
#     if session[:user_id] 
#        @patient = Patient.find_by_id(params[:id])
#        erb :'patients/edit'
#     else
#       redirect to '/login'
#     end
#   end

#   patch '/patients/:id' do 
#     if params[:name] == ""
#       redirect to "/patients/#{params[:id]}/edit"
#     else
#       @patient = Patient.find_by_id(params[:id])
#       @patient.name = params[:name]
#       @patient.age = params[:age]
#       @patient.email = params[:email]
#       @patient.password_digest = params[:password_digest]
#       @patient.save
      
#       @user=User.find_by_id(@patient.id)
#       @user=@patient
#       @user.save
#       redirect to "/doctors/#{@doctor.id}"
#     end
#   end
end