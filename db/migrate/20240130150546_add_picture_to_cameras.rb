class AddPictureToCameras < ActiveRecord::Migration[7.1]
  def change
    add_column :cameras, :picture_url, :string
  end
end
