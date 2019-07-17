class LoginController < ApplicationController

  def login_up
    puts params
    @empleado = Empleado.find_by(dni: params[:dni])

    if @empleado && @empleado.authenticate(params[:password])
      session[:current_user_id] = @empleado.id
      redirect_to "/mesa/ver"
    else
      puts "No se encontro un usuario con estas claves"
      flash[:fail] = "Usuario o password incorrecto"
      redirect_to root_url
    end
  end

  def log_off
    session[:current_user_id] = nil     
    redirect_to '/login' 
  end

end
