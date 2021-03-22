class QuestionsController < ApplicationController
  before_action :test, only: %i[index create new]
  before_action :question, only: %i[show destroy]  # не было в задании, но сделал для удобства
  
  # /tests/1/questions
  def index
    @questions = @test.questions
    render plain: @questions.inspect
  end

  # /tests/1/questions/2
  def show
    render plain: @question.inspect
  end

  # /tests/1/questions/new
  def new; end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to test_questions_path
    else
      render plain: @question.errors.messages
      # or render :new
    end
  end

  def destroy
    @question.destroy
    redirect_to test_questions_path
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def test
    @test = Test.find(params[:test_id])
  end

  def question
    @question = Question.find(params[:id])
  end
end
