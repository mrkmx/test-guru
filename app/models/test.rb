class Test < ApplicationRecord
  belongs_to :category

  def self.by_category(title)
    Test.includes(:category).where('categories.title = ?', title).order(title: :desc).pluck(:title)
  end
end
