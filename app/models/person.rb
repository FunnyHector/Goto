class Person < ActiveRecord::Base
  has_many :ranks
  has_many :skills, -> { distinct }, through: :ranks
  has_many :person_comments, dependent: :destroy

  validates :f_name, presence: true
  validates :email, uniqueness: true, allow_nil: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :slack, uniqueness: true, allow_nil: true
  validates :mobile, uniqueness: true, allow_nil: true

  def full_name
    l_name.present? ? "#{f_name} #{l_name}" : f_name
  end
end
