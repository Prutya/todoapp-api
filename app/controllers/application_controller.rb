class ApplicationController < ActionController::API
  include Knock::Authenticable

  before_action :authenticate_user

  protected

  def page
    params[:page]&.to_i
  end

  def per_page
    params[:per_page]&.to_i
  end
end
