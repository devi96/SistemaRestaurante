class AddValuesToPedidos < ActiveRecord::Migration[5.2]
  def change
    add_column :pedidos, :mesa_id, :string
    add_column :pedidos, :platillo_id, :string
    add_column :pedidos, :estado, :string
    add_column :pedidos, :cantidad, :integer
    add_column :pedidos, :tiempo_espera, :string
  end
end
