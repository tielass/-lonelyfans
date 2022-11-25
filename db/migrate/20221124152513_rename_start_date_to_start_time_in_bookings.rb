class RenameStartDateToStartTimeInBookings < ActiveRecord::Migration[7.0]
  def up
    rename_column :bookings, :start_date, :start_time
  end

  def down
    rename_column :bookings, :start_time, :start_date
  end
end
