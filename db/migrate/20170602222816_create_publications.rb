class CreatePublications < ActiveRecord::Migration[5.0]
  def change
    create_table :publications do |t|
      t.string :title
      t.text :descryption
      t.attachment :file

      t.timestamps
    end
  end
end
