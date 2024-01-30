class CreateCameras < ActiveRecord::Migration[7.1]
  def change
    create_table :cameras do |t|
      t.string :name
      t.float :price
      t.text :details
      t.string :category
      t.integer :year
      t.string :model
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
