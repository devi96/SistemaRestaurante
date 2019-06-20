class CreateReservacions < ActiveRecord::Migration[5.2]
  def change
    create_table :reservacions do |t|

      t.timestamps
    end
  end
end
