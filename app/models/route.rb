class Route < ApplicationRecord
  belongs_to :user
  enum travel_mode: [:DRIVING, :WALKING, :TRANSIT]
end
