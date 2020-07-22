class AddGoogleimageToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :google_image, :string
  end
end
