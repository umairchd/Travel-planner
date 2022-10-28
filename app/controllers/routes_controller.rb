class RoutesController < ApplicationController
  before_action :find_user, only: [:index]

  def index
    render json: { routes: @user.routes }, status: :ok
    
  end

end
