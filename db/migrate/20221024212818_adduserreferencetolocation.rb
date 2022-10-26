class Adduserreferencetolocation < ActiveRecord::Migration[7.0]
  def change
    add_reference :locations, :user, index: true

  end
end
