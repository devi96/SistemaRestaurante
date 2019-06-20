class ChangeRegistroPagosToPagos < ActiveRecord::Migration[5.2]
  def change
  	  rename_table :registro_pagos, :pagos
  end
end
