class CreateRoundAdditionals < ActiveRecord::Migration[5.2]
  def change
    create_table :round_additionals do |t|
      t.string :name
      t.belongs_to :round, foreign_key: true
      t.string :address
      t.string :extra

      t.timestamps
    end
  end
end
