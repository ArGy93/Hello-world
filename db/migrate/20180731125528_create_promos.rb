class CreatePromos < ActiveRecord::Migration[5.1]
  def change
    create_table :promos do |t|
      t.string :name, index: true
      t.integer :owner_id
      t.string :ref, index: true

      t.timestamps
    end
  end
end
