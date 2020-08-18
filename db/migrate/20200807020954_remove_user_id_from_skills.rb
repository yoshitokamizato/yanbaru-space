class RemoveUserIdFromSkills < ActiveRecord::Migration[6.0]
  def change
    remove_column :skills, :user_id, :integer
  end
end
