class CreateFacilityServices < ActiveRecord::Migration[5.0]
  def change
    create_table :facility_services do |t|
      t.references :facility, foreign_key: true
      t.references :service, foreign_key: true

      t.timestamps
    end
  end
end
