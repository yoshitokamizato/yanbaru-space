class AddSkillToUserSkill < ActiveRecord::Migration[6.0]
  def change
    add_column :user_skills, :skill, :string
  end
end
