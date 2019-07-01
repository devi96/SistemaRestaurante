class CreateOrdens < ActiveRecord::Migration[5.2]
  def change
    create_table :ordens do |t|
      t.integer :pedido_id
      t.integer :codigoOrden
      t.integer :pago_id
  
      t.timestamps
    end
  end
end
