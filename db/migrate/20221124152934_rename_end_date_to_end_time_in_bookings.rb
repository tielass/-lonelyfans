class RenameEndDateToEndTimeInBookings < ActiveRecord::Migration[7.0]
  def up
    rename_column :bookings, :end_date, :end_time
  end

  def down
    rename_column :bookings, :end_time, :end_date
  end
end
