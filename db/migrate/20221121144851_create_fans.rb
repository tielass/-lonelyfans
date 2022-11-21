class CreateFans < ActiveRecord::Migration[7.0]
  def change
    create_table :fans do |t|
      t.string :nationality
      t.string :name
      t.text :description
      t.boolean :availability
      t.string :category
      t.references :user, null: false, foreign_key: true
      t.float :price

      t.timestamps
    end
  end
end
