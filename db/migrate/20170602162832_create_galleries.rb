class CreateGalleries < ActiveRecord::Migration[5.0]
  def change
    create_table :galleries do |t|
      t.string :description
      t.attachment :image

      t.timestamps
    end
  end
end