class PersonalController < ApplicationController
  def history
    @tickets = current_user.tickets.for_history.page(params[:page])
  end
end
