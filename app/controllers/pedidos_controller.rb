class PedidosController < ApplicationController
  def listar

  end
  def getAllActivos
    puts params
    mesa_id = params[:IDmesa]

    @pedidos = Pedido.getAllActivos(mesa_id)

    render json: @pedidos, status: :ok
    
  end
  
  def getPlatillos
    @platillos = Platillo.all
    render json: @platillos, status: :ok
  end


  def buscar
    puts "Se esta buscando el pedido"
    mesa_id = params[:IDmesa]
    @pedidos = Pedido.getBuscarActivos(mesa_id)

    render json: @pedidos, status: :ok

  end
  
  def create

   	mesa_id = params[:IDmesa]
   	platillo_id = params[:IDplatillo]
   	cantidad = params[:cantidad]

    @Pedido = Pedido.new
    @Pedido.mesa_id = mesa_id
    @Pedido.platillo_id = platillo_id
    @Pedido.estado = "EN ESPERA"
    @Pedido.cantidad = cantidad
    @Pedido.tiempo_espera = Time.now


    if @Pedido.save
      render json: @Pedido, status: :ok
    else
      render json: @Pedido.errors, status: :unprocessable_entity
    end


  end


end
