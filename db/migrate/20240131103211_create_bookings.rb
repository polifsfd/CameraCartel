class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.time :start_date
      t.time :finish_date
      t.references :user, null: false, foreign_key: true
      t.references :camera, null: false, foreign_key: true

      t.timestamps
    end
  end
end
