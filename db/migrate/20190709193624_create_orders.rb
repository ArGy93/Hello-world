class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.belongs_to :round, foreign_key: true
      t.belongs_to :user, foreign_key: true
      t.integer :amount
      t.string :transaction_id, index: true
      t.string :aasm_state

      t.timestamps
    end
  end
end
