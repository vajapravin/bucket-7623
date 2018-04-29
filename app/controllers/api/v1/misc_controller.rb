class Api::V1::MiscController < API::V1::BaseController
  def profile
    render json: current_user
  end

  def validate_token
    render json: { success: user_signed_in? }
  end
end