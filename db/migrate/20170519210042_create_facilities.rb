class CreateFacilities < ActiveRecord::Migration[5.0]
  def change
    create_table :facilities do |t|
      t.text :title
      t.text :description
      t.text :contact
      t.attachment :image

      t.timestamps
    end
  end
end
