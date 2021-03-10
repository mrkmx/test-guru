class User < ApplicationRecord
  has_many :tests_users
  has_many :tests, through: :tests_users
  has_many :answers

  def tests_by_level(level)
    Test.where(level: level).joins(:tests).where('results.user_id = ?', id)
  end
end
