module QuestionsHelper
  HEADERS = { 
    create: 'Создать новый вопрос для теста ',
    edit: 'Редактировать вопрос теста '
  }.freeze

  def question_header(question)
    test_title = question.test.title
    question.new_record? ? HEADERS[:create] + test_title : HEADERS[:edit] + test_title
  end
end
