class SkillComment < ActiveRecord::Base
  belongs_to :skill

  validates :commenter, presence: true, length: { minimum: 1, maximum: 50 }
  validates :comment, presence: true, length: { minimum: 1, maximum: 500 }



end