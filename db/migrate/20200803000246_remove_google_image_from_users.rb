class RemoveGoogleImageFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :google_image, :string
  end
end
