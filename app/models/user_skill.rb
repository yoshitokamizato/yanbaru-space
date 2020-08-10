class UserSkill < ApplicationRecord
  validates :user_id, uniqueness: { scope: :skill_id }
  belongs_to :user
  belongs_to :skill
end
