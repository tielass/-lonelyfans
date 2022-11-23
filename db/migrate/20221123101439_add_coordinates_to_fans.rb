class AddCoordinatesToFans < ActiveRecord::Migration[7.0]
  def change
    add_column :fans, :latitude, :float
    add_column :fans, :longitude, :float
  end
end
