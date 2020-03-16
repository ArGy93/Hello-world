class RoundDecorator < Draper::Decorator
  delegate_all


  def available_tickets
    tickets_amount - tickets.count
  end

  def ticket_price
    return 0 unless price

    price / tickets_amount
  end

end
