class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.belongs_to :user, foreign_key: true
      t.string :guid
      t.belongs_to :round, foreign_key: true

      t.timestamps
    end
    add_reference :rounds, :ticket, foreign_key: true
  end
end
