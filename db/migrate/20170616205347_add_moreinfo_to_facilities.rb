class AddMoreinfoToFacilities < ActiveRecord::Migration[5.0]
  def change
    add_column :facilities, :model, :string
    add_column :facilities, :make, :string
  end
end
