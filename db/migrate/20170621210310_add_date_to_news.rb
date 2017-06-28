class AddDateToNews < ActiveRecord::Migration[5.0]
  def change
    add_column :news, :year, :integer
    add_column :news, :month, :string
  end
end
