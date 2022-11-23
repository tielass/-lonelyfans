class AddImageUrlToFans < ActiveRecord::Migration[7.0]
  def change
    add_column :fans, :image_url, :string
  end
end
