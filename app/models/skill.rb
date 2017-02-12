class Skill < ActiveRecord::Base
  has_many :ranks
  has_many :people, through: :ranks
  has_many :skill_comments

  validates :title, presence: true, uniqueness: true, length: { minimum: 1, maximum: 50 }
  validates :description, length: { minimum: 1, maximum: 500 }

end