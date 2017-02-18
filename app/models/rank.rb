class Rank < ActiveRecord::Base
  MAX_NUM_QUESTIONS = 3

  # TODO: some uniqueness validation:
  #       1. each (person, skill) pair must be unique

  belongs_to :skill
  belongs_to :person
  has_many :rank_comments, dependent: :destroy

  validates :thumb_ups, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :thumb_downs, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :by_person, -> (person) { where(:person => person) } # TODO: better wording
  scope :by_skill, -> (skill) { where(:skill => skill) } # TODO: better wording
  scope :best_skill_of_person, ->(person) { by_person(person).maximum(:thumb_ups) }
  scope :best_person_of_skill, ->(skill) { by_skill(skill).maximum(:thumb_ups) }
  scope :worst_skill_of_person, ->(person) { by_person(person).minimum(:thumb_ups) }
  scope :worst_person_of_skill, ->(skill) { by_skill(skill).minimum(:thumb_ups) }

  # only for MAX_NUM_QUESTIONS problems maximum
  def self.best_person_for_skills(*skills)
    raise Error::TooManyQuestionsError.new("Cannot search more than #{MAX_NUM_QUESTIONS} questions") if skills.size > MAX_NUM_QUESTIONS

    









    # FIXME a proper algorithm needed
    Person.first # for testing
  end

  def to_s
    "#{person.full_name} -- #{skill.title}"
  end

end
