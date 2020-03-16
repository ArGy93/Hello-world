class AddImageToRounds < ActiveRecord::Migration[5.1]
  def change
    add_column :rounds, :image, :string
  end
end
