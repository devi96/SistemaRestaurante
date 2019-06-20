class Pedido < ApplicationRecord
	

	def self.getAllActivos(mesa_id)
		pedidos = Pedido.where(mesa_id: mesa_id)
		pedidos = pedidos.where.not(estado: "PAGADO")
		return pedidos
	end

end
