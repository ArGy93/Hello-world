class CreateRounds < ActiveRecord::Migration[5.1]
  def change
    create_table :rounds do |t|
      t.string :name
      t.integer :tickets_count, default: 0
      t.integer :price
      t.string :description
      t.integer :tickets_count
      t.string :aasm_state

      t.timestamps
    end
  end
end
