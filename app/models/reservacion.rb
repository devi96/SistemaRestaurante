class Reservacion < ApplicationRecord


def self.getBuscarActivos(dni)
		if dni.blank?
			reservacion = Reservacion.all
		else
			reservacion = Reservacion.where("dni LIKE ? OR nombresApellidos LIKE ?", "%#{dni}%" , "%#{dni}%")
		end

		reservacion = reservacion.where(estado: "ACTIVO")
		array_reservacion= []
		
		if !reservacion.blank?
					
			reservacion.each do |res|
				obj_r = {}
				obj_r = {id: res.id , mesa_id: res.mesa_id, dni: res.dni , nombres: res.nombresApellidos, tiempo_espera: res.tiempo_espera}
				array_reservacion << obj_r
			end
		end
		
		return array_reservacion
	end

end
