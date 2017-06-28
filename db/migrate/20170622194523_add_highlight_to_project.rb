class AddHighlightToProject < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :highlight, :integer
  end
end
