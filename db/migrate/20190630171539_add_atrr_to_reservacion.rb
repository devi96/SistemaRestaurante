class AddAtrrToReservacion < ActiveRecord::Migration[5.2]
  def change
  	    add_column :reservacions, :dni, :string, :limit => 8
	    add_column :reservacions, :nombresApellidos, :string
	    add_column :reservacions, :regular, :string
		add_column :reservacions, :mesa_id, :integer
		add_column :reservacions, :tiempo_espera, :string
		add_column :reservacions, :horaReservacion, :time
		add_column :reservacions, :estado, :string
		change_column :pedidos, :mesa_id, :integer
		change_column :pedidos, :platillo_id, :integer
		change_column :pedidos, :tiempo_espera, :string
		rename_column :empleados, :password, :password_digest

  end
end
