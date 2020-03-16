class RoundsController < ApplicationController
  def history
    @rounds = Round.for_history.reverse_order.page(params[:page])
  end
end
