class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.attachment :image
      t.text :description
      t.text :publication
      t.references :user, foreign_key: true

      t.timestamps
    end

  end
end
