class IndexController < ApplicationController
  def index
    result = Web::Index::Fetcher.perform

    if result.success?
      @data = result[:data]
    else
      render_error_result(result)
    end
  end
end
