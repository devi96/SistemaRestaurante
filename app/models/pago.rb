class Pago < ApplicationRecord

	def self.getBuscarNoPagados(text_buscar)
		if text_buscar.blank?
			pagos = Pago.all
		else
			pagos = Pago.where(id: text_buscar)
		end

		pagos = pagos.where(estado: "NO PAGADO")
		array_pagos = []
		
		if !pagos.blank?
					
			pagos.each do |pag|
				obj_p = {}
				obj_p = {id: pag.id , mesa_id: pag.mesa_id, codigo: pag.codigo , ruc: pag.ruc, monto: pag.monto, moneda: pag.moneda, estado: pag.estado, forma_pago: pag.forma_pago, comprobante_pago: pag.comprobante_pago}
				array_pagos << obj_p
			end
		end
		
		return array_pagos
	end
	
end
