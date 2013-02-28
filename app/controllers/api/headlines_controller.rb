class Api::HeadlinesController < ActionController::Base
  def index
    @headlines = Headline.all
    render :json => {headlines: @headlines}
  end
end