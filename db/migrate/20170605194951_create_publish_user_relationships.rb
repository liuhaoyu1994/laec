class CreatePublishUserRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :publish_user_relationships do |t|
      t.integer :publication_id
      t.integer :user_id

      t.timestamps
    end
    
    add_index :publish_user_relationships, :publication_id
    add_index :publish_user_relationships, :user_id
    add_index :publish_user_relationships, [:publication_id, :user_id], unique: true
  end
end
