Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/login", to: "main#login"
  post "/loggearse", to: "login#login_up"
  get "/log_off", to: "login#log_off"

  get "/mesa/ver", to: "mesas#ver"
  get "/pedidos", to: "pedidos#listar"
  get "/Pagos", to: "pagos#index"
  get "/mesa/reservacion", to: "mesas#reservacion"

  #pedidos
  post "/getAllpedidosActivosMesa", to: "pedidos#getAllActivos"
  post "/createPedido", to: "pedidos#create"
  get "/buscarPedido", to: "pedidos#buscar", :as => "buscar_pedidos"
  get "/getMesasOcupadas", to: "mesas#getOcupadas"
  get "/getPlatillos", to: "pedidos#getPlatillos"
  post "/eliminarPedido", to: "pedidos#eliminarPedido"
  post "/actualizarPedido", to: "pedidos#actualizarPedido"
  get "/getPedido", to: "pedidos#getPedido"
  #mesas

  post "/cambiarEstadoMesa", to: "mesas#cambiarEstadoMesa"
  post "/reservarMesa", to: "mesas#reservarMesa"
  get "/getReservacion", to: "mesas#getReservacion"
  get "/buscarReservacion", to: "mesas#buscarReservacion"
  post "/eliminarReservacion", to: "mesas#eliminarReservacion"


  # pagos
  post "/createOrdenPago", to: "pagos#createOrdenPago"
  get "/buscarPagos", to: "pagos#buscarPagos"
  root "main#login"
end
