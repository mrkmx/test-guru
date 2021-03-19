class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users

  validates :title, presence: true,
                    uniqueness: { scope: :level,
                                  message: "Может существовать только один Тест с данным названием и уровнем" }
  validates :level, numericality: { only_integer: true, greater_than: 0 }

  scope :by_grade, -> (grade) { where(level: level_range(grade)) }
  scope :by_level, -> (level) { where(level: level) }
  scope :by_category_title, -> (title) { joins(:category).where('categories.title = ?', title) }

  def self.by_category(title)
    by_category_title(title).order(title: :desc).pluck(:title)
  end

  private

  def self.level_range(grade)
    case grade
    when :easy
      0..1
    when :medium
      2..4
    when :hard
      5..Float::INFINITY
    else
      raise 'Доступные уровни: :easy, :medium, :hard '
    end
  end

end
