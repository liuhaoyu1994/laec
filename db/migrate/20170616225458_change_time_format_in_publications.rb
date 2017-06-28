class ChangeTimeFormatInPublications < ActiveRecord::Migration[5.0]
  def change
    change_column :publications, :time, :integer
  end
end
