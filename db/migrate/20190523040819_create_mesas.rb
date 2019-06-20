class CreateMesas < ActiveRecord::Migration[5.2]
  def change
    create_table :mesas do |t|
      t.integer :capacidad
      t.string :estado
      t.integer :client_id

      t.timestamps
    end
  end
end
