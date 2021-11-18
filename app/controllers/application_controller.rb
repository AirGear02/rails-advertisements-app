class ApplicationController < ActionController::Base
  def index
    redirect_to advertisements_index_url
  end
end
