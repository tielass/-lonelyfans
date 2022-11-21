class AddFanToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :fan, :boolean
  end
end
