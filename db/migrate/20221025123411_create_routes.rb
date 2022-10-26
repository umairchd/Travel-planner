class CreateRoutes < ActiveRecord::Migration[7.0]
  def change
    create_table :routes do |t|
      t.string :origin
      t.string :destination
      t.string :summary
      t.string :duration
      t.integer :travel_mode
      t.string :distance
      t.string :trace
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
