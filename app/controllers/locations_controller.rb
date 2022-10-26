class LocationsController < ApplicationController
  before_action :find_user, only: [:index, :calculate_routes, :create]
  before_action :white_list_category, only: [:create]

  def index
    render json: { locations: @user.locations }, status: :ok
  end

  def create
    @location = @user.locations.find_or_initialize_by(category: location_params[:category])
    @location.assign_attributes(location_params)
    if @location.save
      render json: @user.locations, status: :ok
    else
      render json: @location.errors, status: :unprocessable_entity
    end
  end

  def calculate_routes
    return render json: { message: "Routes already generated" }, status: :ok unless @user.routes.empty?

    routes = GenerateRoutes.routes_generator(@user)
    if routes.success == true
      render json: { routes: @user.routes }, status: :ok
    else
      render json: { error: 'Routes not generated, try again later' }, status: :unprocessable_entity
    end
  end

  private

  def location_params
    params.permit(:address, :category, :user_id)
  end

  def white_list_category
    unless ['home', 'work'].include? location_params[:category]
      return render json: { message: "Invalid location category", status: :not_found }
    end
  end

end
