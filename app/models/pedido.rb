class Pedido < ApplicationRecord
	

	def self.getAllActivos(mesa_id)
		pedidos = Pedido.where(mesa_id: mesa_id)
		pedidos = pedidos.where.not(estado: "PAGADO")
		array_pedidos = []

		if !pedidos.blank?
			
			
			pedidos.each do |ped|
				obj_p = {}
				platillo = Platillo.find(ped.platillo_id)
				obj_p = {id: ped.id , platillo_id: platillo.nombre , cantidad: ped.cantidad, estado: ped.estado, tiempo_espera: ped.tiempo_espera, costo: platillo.precio}
				array_pedidos << obj_p
			end
		end
		
		return array_pedidos
	end

end
