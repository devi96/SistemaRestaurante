class CreateEmpleados < ActiveRecord::Migration[5.2]
  def change
    create_table :empleados do |t|
      t.string :nombre
      t.string :apellido
      t.string :dni
      t.string :password
      t.string :rol

      t.timestamps
    end
  end
end
