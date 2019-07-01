class MesasController < ApplicationController
  def ver
    @mesas = Mesa.all
  end

  def reservacion
  end
  
  def buscarReservacion
    puts "Se esta buscando el pedido"
    dni = params[:dni]
    @pedidos = Reservacion.getBuscarActivos(dni)

    render json: @pedidos, status: :ok

  end
  
  def eliminarReservacion
    puts params
    reservacion_id = params[:IDreservacion]

    @reservacion = Reservacion.find(reservacion_id)

    @mesa = Mesa.find(@reservacion.mesa_id)
    
    @mesa.estado = "LIBRE"
    if @mesa.save
      puts "No hubo problemas"
    end

    if @reservacion
      @reservacion.destroy
    end
    render json: @reservacion, status: :ok
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
      @reservacion.horaReservacion = Time.now
      tiempo_espera = Time.at((Time.now - @reservacion.horaReservacion).to_i.abs).utc.strftime "%H h, %M min y %S seg"

      if tiempo_espera.nil?
          @reservacion.tiempo_espera = "00 h, 00 min y 00 seg"
      else
          @reservacion.tiempo_espera = tiempo_espera
      end

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
