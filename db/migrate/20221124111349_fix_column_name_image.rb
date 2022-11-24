class FixColumnNameImage < ActiveRecord::Migration[7.0]
  def change
    rename_column :fans, :image_url, :photo
  end
end
