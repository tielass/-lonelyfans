class AddAddressToFans < ActiveRecord::Migration[7.0]
  def change
    add_column :fans, :address, :string
  end
end
