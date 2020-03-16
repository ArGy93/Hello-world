class OrdersController < ApplicationController
  def create
    result = Web::Orders::CreateService.perform params

    if result.success?
      redirect_to result[:data]
    else
      render_error_result(result)
    end
  end

  def update
    raise 'Not implemented yet'
  end
end
