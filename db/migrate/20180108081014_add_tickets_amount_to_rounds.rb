class AddTicketsAmountToRounds < ActiveRecord::Migration[5.1]
  def change
    add_column :rounds, :tickets_amount, :integer, default: 1000
  end
end
