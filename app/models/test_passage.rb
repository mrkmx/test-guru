class TestPassage < ApplicationRecord
  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_next_question

  SUCCESS_THRESHOLD = 85

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def completed?
    current_question.nil?
  end

  def current_question_number
    test.questions.where('id <= ?', current_question.id).count
  end

  def questions_count
    test.questions.count
  end

  def percent_result
    correct_questions * 100 / questions_count
  end

  def success?
    percent_result >= SUCCESS_THRESHOLD
  end

  def passage_progress
    100 / questions_count * (current_question_number - 1)
  end

  private

  def before_validation_set_next_question
    self.current_question = if new_record?
      test.questions.order(:id).first if test.present?
    else
      test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end
end
