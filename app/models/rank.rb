class Rank < ActiveRecord::Base
  class SomeKindOfError < Error; end  # TODO need to rename

  belongs_to :skill
  belongs_to :person
  has_many :rank_comments

  validates :thumb_ups, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :thumb_downs, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :by_person, -> (person) { where(:person => person) } # TODO: better wording
  scope :by_skill, -> (skill) { where(:skill => skill) } # TODO: better wording
  scope :best_skill_of_person, ->(person) { by_person(person).maximum(:thumb_ups) }
  scope :best_person_of_skill, ->(skill) { by_skill(skill).maximum(:thumb_ups) }
  scope :worst_skill_of_person, ->(person) { by_person(person).minimum(:thumb_ups) }
  scope :worst_person_of_skill, ->(skill) { by_skill(skill).minimum(:thumb_ups) }



  # with a 100-people company, I shouldn't need very complicated algorithm

  # only for 3 problems maximum
  def self.best_guy_for_skills(*skills)
    # pseudo code algorithm
    # if there is a guy who knows ALL these skills

    if skills.size > 3
      raise SomeKindOfError
    end


  end


end