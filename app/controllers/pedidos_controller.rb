class PedidosController < ApplicationController
  
  def listar
  end
  
  def getPedido
    puts params
    
    pedido_id = params[:IDpedido]

    @pedido = Pedido.find(pedido_id)

    render json: { data: @pedido }, status: :ok
  end
  
  def getAllActivos
    puts params
    mesa_id = params[:IDmesa]

    @pedidos = Pedido.getAllActivos(mesa_id)

    render json: @pedidos, status: :ok
    
  end
  
  def actualizarPedido
    puts params
    
    pedido_id = params[:IDpedido]
    estado = params[:estado]
    mesa_id = params[:IDmesa]
    platillo_id = params[:IDplatillo]
    cantidad = params[:cantidad]

    @pedido = Pedido.find(pedido_id)
    if @pedido
      @pedido.estado = estado
      @pedido.mesa_id = mesa_id
      @pedido.platillo_id = platillo_id
      @pedido.estado = estado
      @pedido.cantidad = cantidad
      @pedido.save
    end
    render json: @pedido, status: :ok
  end
  
  def eliminarPedido
    puts params
    pedido_id = params[:IDpedido]

    @pedido = Pedido.find(pedido_id)
    if @pedido
      @pedido.destroy
    end
    render json: @pedido, status: :ok
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
    @Pedido.horaPedido = Time.now
    tiempo_espera = Time.at((Time.now - @Pedido.horaPedido).to_i.abs).utc.strftime "%H h, %M min y %S seg"

    puts tiempo_espera
    puts "Esto fue el tiempo espera"
    if tiempo_espera.nil?
      @Pedido.tiempo_espera = "00 h, 00 min y 00 seg"
    else
      @Pedido.tiempo_espera = tiempo_espera
    end

    if @Pedido.save
      render json: @Pedido, status: :ok
    else
      render json: @Pedido.errors, status: :unprocessable_entity
    end


  end


end
