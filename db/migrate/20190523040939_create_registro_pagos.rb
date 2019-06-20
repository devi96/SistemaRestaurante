class CreateRegistroPagos < ActiveRecord::Migration[5.2]
  def change
    create_table :registro_pagos do |t|
      t.string :ruc
      t.string :codigo
      t.date :fecha

      t.timestamps
    end
  end
end
