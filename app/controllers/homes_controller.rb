class HomesController < ApplicationController
  def index
    render json: {welcome: "Welcome to travel guide"}, status: :ok
  end
end
