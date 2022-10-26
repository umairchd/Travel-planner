class ApplicationController < ActionController::API
  def find_user
    unless @user = User.find_by(id: params[:user_id])
      return render json: { message: 'User not found' }, status: :not_found
    end
  end
end
