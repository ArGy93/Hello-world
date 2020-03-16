class AddCardTypeToRound < ActiveRecord::Migration[5.2]
  def change
    add_column :rounds, :card_type, :string, default: 'left'
  end
end
