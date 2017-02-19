class Rank < ActiveRecord::Base
  MAX_NUM_KEYWORDS = 3

  # TODO: some uniqueness validation:
  #       1. each (person, skill) pair must be unique

  belongs_to :skill
  belongs_to :person
  has_many :rank_comments, dependent: :destroy

  validates :skill, uniqueness: { scope: :person }
  validates :thumb_ups, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :thumb_downs, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :with_person, -> (person_id) { where(:person_id => person_id) } # TODO: better wording
  scope :with_skill, -> (skill) { where(:skill_id => Skill.find_by(title: skill).id) } # TODO: better wording
  scope :order_by_most_thumb_ups, -> { order(thumb_ups: :desc) }
  scope :order_by_least_thumb_downs, -> { order(:thumb_downs) }

  # scope :best_skill_of_person, ->(person) { by_person(person).maximum(:thumb_ups) }
  # scope :best_person_of_skill, ->(skill) { by_skill(skill).maximum(:thumb_ups) }
  # scope :worst_skill_of_person, ->(person) { by_person(person).minimum(:thumb_ups) }
  # scope :worst_person_of_skill, ->(skill) { by_skill(skill).minimum(:thumb_ups) }

  def to_s_oneline
    "#{person.full_name} -- #{skill.title}"
  end
end
