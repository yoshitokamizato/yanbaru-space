class RenameSkillColumnToSkills < ActiveRecord::Migration[6.0]
  def change
    rename_column :skills, :skill, :name
  end
end
