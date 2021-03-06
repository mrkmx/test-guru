class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_many :test_passages, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :users, through: :test_passages

  validates :title, presence: true,
                    uniqueness: { scope: :level,
                                  message: "Может существовать только один Тест с данным названием и уровнем" }
  validates :level, numericality: { only_integer: true, greater_than: 0 }

  scope :by_grade, -> (grade) { where(level: level_range(grade)) }
  scope :by_level, -> (level) { where(level: level) }
  scope :by_category_title, -> (title) { joins(:category).where('categories.title = ?', title) }
  scope :by_category_id, -> (id) { joins(:category).where('categories.id = ?', id) }

  def self.by_category(title)
    by_category_title(title).order(title: :desc).pluck(:title)
  end

  def test_time_to_sec
    test_time * 60 if test_time.present?
  end

  private

  def self.level_range(grade)
    case grade
    when :easy
      1..2
    when :medium
      3..4
    when :hard
      5..Float::INFINITY
    else
      raise 'Доступные уровни: :easy, :medium, :hard '
    end
  end

end
