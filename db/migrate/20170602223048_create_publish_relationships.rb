class CreatePublishRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :publish_relationships do |t|
      t.references :publication, foreign_key: true
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
