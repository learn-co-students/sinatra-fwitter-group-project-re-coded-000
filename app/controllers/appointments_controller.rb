class AppointmentsController < ApplicationController
  get '/appointments' do 
    erb :'/appointments/new'
  end

post '/appointments' do
raise params.inspect
   if params[:date] == ""
      redirect to "/appointments/new"
    else
      user = User.find_by_id(session[:user_id])
      # doctor = Doctor.find_by_id()
      @appointment = Appointment.create(:appointment_date => params[:date],:user_id => user.id)
      redirect to "/appointments/#{@appointment.id}"
    end
  end


  get 'appointments/:id' do 

    if session[:user_id]
      @appointment = Appointment.find_by_id(params[:id])
      erb :'appointments/appointments'
    else 
      redirect to '/login'
    end  
  end

end