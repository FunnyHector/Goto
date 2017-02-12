class Person < ActiveRecord::Base
  has_many :ranks
  has_many :skills, -> { distinct }, through: :ranks
  has_many :person_comments

  validates :f_name, presence: true
  validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :slack, uniqueness: true
  validates :mobile, uniqueness: true


end