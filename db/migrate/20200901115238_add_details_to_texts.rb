class AddDetailsToTexts < ActiveRecord::Migration[6.0]
  def change
    add_column :texts, :genre, :string
    add_column :texts, :title, :string
  end
end
