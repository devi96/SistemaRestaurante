class AddMoreAtributesToPagos < ActiveRecord::Migration[5.2]
  def change
  	add_column :pagos, :monto, :float
    add_column :pagos, :moneda, :string
    add_column :pagos, :estado, :string
    add_column :pagos, :forma_pago, :string
    add_column :pagos, :comprobante_pago, :string
    add_column :pagos, :mesa_id, :integer
    add_column :platillos, :tipo_platillo, :string
  end
end
