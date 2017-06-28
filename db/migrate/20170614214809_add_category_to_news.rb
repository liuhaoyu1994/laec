class AddCategoryToNews < ActiveRecord::Migration[5.0]
  def change
    add_column :news, :categoty, :integer
  end
end
