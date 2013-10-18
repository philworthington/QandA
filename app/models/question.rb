class Question < ActiveRecord::Base
  attr_accessible :answer, :question
  validates :question, :presence => true
  has_many :authors
  has_many :users, :through => :authors

  def has_been_updated_by_user?(user)
    return self.users.include? user
  end
end
