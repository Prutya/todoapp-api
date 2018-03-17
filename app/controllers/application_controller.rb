class ApplicationController < ActionController::API
  protected

  def page
    params[:page]&.to_i
  end

  def per_page
    params[:per_page]&.to_i
  end
end
