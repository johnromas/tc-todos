class Api::BaseController < ActionController::Base
  protect_from_forgery with: :null_session

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  attr_reader :current_user

  def set_user
    @current_user ||= User.find(params[:user_id])
  end

  def record_not_found(exception)
    error = "There was an error: #{exception.to_s}"
    render text: error, status: :not_found
  end
end
