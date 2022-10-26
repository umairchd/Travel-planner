class AddaddressCategoryInLocation < ActiveRecord::Migration[7.0]
  def change
    add_column :locations, :category, :integer

  end
end
