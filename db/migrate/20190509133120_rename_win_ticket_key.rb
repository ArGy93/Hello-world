class RenameWinTicketKey < ActiveRecord::Migration[5.2]
  def change
    rename_column :rounds, :ticket_id, :win_ticket_id
  end
end
