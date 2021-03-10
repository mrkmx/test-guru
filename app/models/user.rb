class User < ApplicationRecord
  has_many :tests
  has_many :answers
  has_many :results

  def tests_by_level(level)
    Test.where(level: level).joins(:results).where('results.user_id = ?', id)
  end
end
