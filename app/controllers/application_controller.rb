class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def render_error_result(result)
    render status: 500, template: 'errors/result', object: result
  end
end
