class Location < ApplicationRecord
  geocoded_by :address
  before_validation :address, on: :update
  belongs_to :user

  after_validation :geocode
  after_update :discard_user_routes

  enum category:  [:home, :work]

  private

  def discard_user_routes
    self.user.routes.destroy_all
  end
end
