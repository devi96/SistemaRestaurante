class LoginController < ApplicationController

  def login_up
    puts params
    @empleado = Empleado.find_by(dni: params[:dni], password: params[:password])

    if @empleado.blank?
      puts "No se encontro un usuario con estas claves"
      redirect_to root_url
    else
      session[:current_user_id] = @empleado.id
      redirect_to "/mesa/ver"
    end


  end

end
