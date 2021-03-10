class Test < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :results
  has_many :questions

  def self.by_category(title)
    joins(:category).where('categories.title = ?', title).order(title: :desc).pluck(:title)
  end
end
