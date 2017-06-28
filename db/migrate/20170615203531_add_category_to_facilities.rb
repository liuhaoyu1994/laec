class AddCategoryToFacilities < ActiveRecord::Migration[5.0]
  def change
    add_column :facilities, :categotry, :string
  end
end
