class User < ApplicationRecord
  has_many :tests_users
  has_many :tests, through: :tests_users
  has_many :authored_tests, class_name: 'Test', foreign_key: :author_id

  validates :name, presence: true

  # Вопрос: реализация переносится в класс Test,
  # а вместо инстанс-метода теперь используем конструкцию вида my_user.tests.by_level(1)?
  # https://guides.rubyonrails.org/active_record_querying.html#scopes
end
