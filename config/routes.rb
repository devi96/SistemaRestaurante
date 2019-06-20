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
  root "main#login"
end
