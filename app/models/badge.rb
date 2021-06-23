class Badge < ApplicationRecord
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :title, :rule, :image, presence: true

  BADGE_RULES = {
      'Прохождение всех тестов из категории' => :rule_all_in_category,
      'Прохождение теста с первой попытки' => :rule_first_try,
      'Прохождение всех тестов уровня' => :rule_all_by_level
  }.freeze

  def self.images
    badges = Dir.glob("app/assets/images/badges/*")
    
    # делаем путь относительным, чтобы иконка попала в assets pipeline
    badges.map { |b| b.delete_prefix('app/assets/images/') }
  end

end