class AddCyclicToRound < ActiveRecord::Migration[5.2]
  def change
    add_column :rounds, :cyclic, :boolean
  end
end
