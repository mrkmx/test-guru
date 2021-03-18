class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_answers_count

  scope :correct, -> { where(correct: true) }

  def validate_answers_count
    errors.add(:question, 'У одного Вопроса может быть от 1-го до 4-х ответов.') if question.answers.count >= 4
  end
end
