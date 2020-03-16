class PagesController < ApplicationController
  def show
    @page = StaticPage.by_slug(params[:slug])
    if @page.instance_of? StaticPage
      if @page.draft && @page.draft_key != params[:key]
        redirect_to '/403.html'
      end
    else
      redirect_to '/404.html'
    end
  end

  def news
    @pages = StaticPage.where(system: false, draft: false).page(params[:page])
  end

  def personal
    result = Web::Index::Fetcher.perform

    if result.success?
      @data = result[:data]
      @rounds = Round.for_history.reverse_order.page(params[:page])
    else
      render_error_result(result)
    end
  end

  def answers
    # @pages = StaticPage.where(system: false, draft: false).page(params[:page])
  end
end
