class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.string :professional_name, null: false
      t.date :appointment_date, null: false
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
