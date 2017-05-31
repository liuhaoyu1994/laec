class CreateRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :relationships do |t|
      t.integer :article_id
      t.integer :author_id

      t.timestamps
    end
    
    add_index :relationships, :article_id
    add_index :relationships, :author_id
    add_index :relationships, [:article_id, :author_id], unique: true
    
  end
end
