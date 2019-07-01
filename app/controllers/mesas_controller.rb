class MesasController < ApplicationController
  def ver
    @mesas = Mesa.all
  end

  def reservacion
  end

  def getOcupadas
  	@mesas = Mesa.all
  	render json: @mesas, status: :ok
  end

  def cambiarEstadoMesa
  	puts "parametros de la mesa #{params}"
  	@mesa = Mesa.find(params["IDmesa"])

  	if @mesa.estado.eql? "RESERVADO"
  		@reservacion = Reservacion.where(mesa_id: params["IDmesa"], estado:"ACTIVO").first rescue nil
  		puts @reservacion.inspect
  		if !(@reservacion.blank?)
  			@reservacion.estado = "INACTIVO"
  			@reservacion.save
  		end
  	end

  	@mesa.estado = params["estado"]
  	@mesa.save

  	render json: @mesa, status: :ok
  end


  def reservarMesa
  puts "parametros de la mesa #{params}"
  @mesa = Mesa.find(params["IDmesa"])
	  if !(@mesa.estado.eql? "LIBRE")
	  	puts "MESA NO LIBRE"
	  	message_fail = "La mesa no estaba libre"
	  	render json: {msg: message_fail}, status: 400
	  else
	  	@mesa.estado = "RESERVADO"
	  	@mesa.save
	  	@reservacion = Reservacion.new
	  	@reservacion.dni = params["dni"]
	  	@reservacion.nombresApellidos = params["nombre"]
	  	@reservacion.mesa_id = @mesa.id
	  	@reservacion.estado = "ACTIVO"
	  	@reservacion.save
	  	render json: {msg: "Se actualizo"}, status: 200
	  end
  end

  def getReservacion
  	puts "Llenar reservacion"
	@reservacion = Reservacion.where(mesa_id: params["IDmesa"], estado:"ACTIVO").first rescue nil
  	_data = {}
  	if @reservacion  
    	_data = { nombre: @reservacion.nombresApellidos, dni: @reservacion.dni}
    	render json: {data: _data}, status: :ok
    else
    	render json: _data, status: 204	
  	end
  end

end
