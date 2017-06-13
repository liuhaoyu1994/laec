class CreateServices < ActiveRecord::Migration[5.0]
  def change
    create_table :services do |t|
      t.text :title
      t.text :description
      t.attachment :image

      t.timestamps
    end
  end
end
