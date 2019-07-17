class PagosController < ApplicationController
  def index
    
  end


  def createOrdenPago
  	mesa_id = params["IDmesa"]
  	@pedidos = Pedido.getBuscarActivos(mesa_id)
  	monto=0
  	puts @pedidos
  	codigoOrdenMax = (Orden.maximum("codigoOrden").to_i + 1)
    if !@pedidos.blank?

    	@pedidos.each do |ped|
    		@pedi = Pedido.find(ped[:id])
    		@pedi.estado = "PAGADO"
    		@pedi.save
    		puts ped
    		puts ped.inspect
    		monto = monto + ped[:costo]
    		puts "VALOR DE MONTO"
    		puts monto
    	end

    	@pago = Pago.new(codigo: codigoOrdenMax, monto: monto, fecha: Time.now , moneda:"SOLES", estado:"NO PAGADO", mesa_id: mesa_id)
    	@pago.save

    	@ordenes = []
    	@pedidos.each do |ped|
    		@ordenes << Orden.new(pedido_id: ped[:id], codigoOrden: codigoOrdenMax ,pago_id: @pago.id)
    	end

    	Orden.transaction do

  	  @ordenes.each do |o|
  	    raise ActiveRecord::Rollback unless o.save
  	  end

      render json: {message: "TODO CORRECTO"}, status: :ok
      end
  else
    render json: {message: "SIN PEDIDOS"}, status: 402
  end

  end
  
  def buscarPagos
  	puts "Se esta buscando todos los pagos"
    text_buscar = params[:text_buscar]
    @pagos = Pago.getBuscarNoPagados(text_buscar)

    render json: @pagos, status: :ok

  end

  def registroPago
    puts "Se esta registrando el pago"
      estado = params[:estado]
      forma_pago = params[:forma_pago]
      comprobante_pago = params[:comprobante_pago]
      ruc = params[:ruc]
      pago_id = params[:pago_id]


      @pago = Pago.find(pago_id)

      if @pago
        @pago.estado = estado
        @pago.forma_pago = forma_pago
        @pago.comprobante_pago = comprobante_pago
        @pago.ruc = ruc
        @pago.save
      end

      render json: @pago, status: :ok
  end
end
