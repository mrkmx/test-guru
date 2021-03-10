class User < ApplicationRecord
  def tests_by_level(level)
    Test.where(level: level).joins(:result).where('results.user_id = ?', id)
  end
end
