class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.references :user, foreign_key: true
      t.references :facility, foreign_key: true
      t.timestamp :start
      t.timestamp :end

      t.timestamps
    end
  end
end
