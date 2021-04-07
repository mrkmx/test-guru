module TestPassagesHelper
  TEST_PASSAGE = {
    success: 'Тест пройден',
    failure: 'Тест не пройден'
  }.freeze

  def result_message(test_passage)
    test_passage.success? ? TEST_PASSAGE[:success] : TEST_PASSAGE[:failure]
  end

  def success_class(test_passage)
    test_passage.success? ? 'success' : 'fail'
  end

  def question_number(test_passage)
    "Вопрос #{test_passage.current_question_number}/#{test_passage.questions_count}"
  end
end
