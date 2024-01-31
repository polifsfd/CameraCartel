class ChangeStartDateAndFinishDateToBeDateInBookings < ActiveRecord::Migration[7.1]
  def change
    remove_column :bookings, :start_date
    remove_column :bookings, :finish_date
    add_column :bookings, :start_date, :date
    add_column :bookings, :finish_date, :date
  end
end
