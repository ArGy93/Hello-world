class ComputeRoundTask
  def self.perform
    Round.where(aasm_state: :active).where('tickets_count >= tickets_amount').each do |round|
      round.update win_ticket: round.tickets.order('RANDOM()').first
      round.finish
      round.save
    end
  end
end
