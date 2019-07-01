class AddUserRolToEmpleados < ActiveRecord::Migration[5.2]
  def change
   	add_column :pedidos, :horaPedido, :time
  end
end
