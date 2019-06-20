class CreatePlatillos < ActiveRecord::Migration[5.2]
  def change
    create_table :platillos do |t|
      t.string :nombre
      t.float :precio

      t.timestamps
    end
  end
end
