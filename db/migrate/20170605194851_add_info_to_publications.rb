class AddInfoToPublications < ActiveRecord::Migration[5.0]
  def change
    add_column :publications, :time, :date
  end
end
