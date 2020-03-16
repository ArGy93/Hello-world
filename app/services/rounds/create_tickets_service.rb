module Rounds
  class CreateTicketsService < BaseService

    def perform
      create_tickets
    end

    private

    def create_tickets
      user = User.find params[:user_id]
      round = Round.find params[:round_id]
      round.tickets_amount.times { Ticket.create user: user, round: round }
      success_result
    rescue StandartError => ex
      error_result errors: ex
    end
  end
end