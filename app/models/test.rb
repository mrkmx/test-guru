class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users

  scope :by_level, -> (level) { where(level: level_range(level)) }

  def self.by_category(title)
    joins(:category).where('categories.title = ?', title).order(title: :desc).pluck(:title)
  end

  private

  def self.level_range(level)
    return 0..1 if level == :easy
    return 2..4 if level == :medium
    return 5..Float::INFINITY if level == :hard
  end

end
