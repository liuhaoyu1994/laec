class CreatePartnerRelations < ActiveRecord::Migration[5.0]
  def change
    create_table :partner_relations do |t|
      t.references :research_partner, foreign_key: true
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
