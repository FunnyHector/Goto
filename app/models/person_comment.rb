class PersonComment < ActiveRecord::Base
  belongs_to :person

  validates :commenter, presence: true, length: { minimum: 1, maximum: 50 }
  validates :comment, presence: true, length: { minimum: 1, maximum: 500 }


end