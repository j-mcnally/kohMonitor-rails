class Api::PagesController < ActionController::Base

  def index
    @pages = Page.all
    render :json => {pages: @pages}
  end

end