class Rank < ActiveRecord::Base
  belongs_to :skill
  belongs_to :person

  validates :thumb_ups, presence: true, numericality: { only_integer: true }

  scope :by_person, -> (person) { where(:person => person) } # TODO: better wording
  scope :by_skill, -> (skill) { where(:skill => skill) } # TODO: better wording
  scope :best_skill_of_person, ->(person) { by_person(person).maximum(:thumb_ups) }
  scope :best_person_of_skill, ->(skill) { by_skill(skill).maximum(:thumb_ups) }
  scope :worst_skill_of_person, ->(person) { by_person(person).minimum(:thumb_ups) }
  scope :worst_person_of_skill, ->(skill) { by_skill(skill).minimum(:thumb_ups) }



  # with a 100-people company, I shouldn't need very complicated algorithm

  def self.best_guy_for_skills(*skills)
    # pseudo
    # if there is a guy who knows ALL these skills


  end


end