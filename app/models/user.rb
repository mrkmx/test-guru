class User < ApplicationRecord
  has_many :tests_users
  has_many :tests, through: :tests_users
  has_many :authored_tests, class_name: 'Test', foreign_key: :author_id

  def tests_by_level(level)
    tests.where(level: level)
  end
end
