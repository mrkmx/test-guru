class QuestionsController < ApplicationController
  before_action :question, only: %i[show edit update destroy]
  before_action :test, only: %i[new create]

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to test_path(@test)
    else
      render :new
    end
  end

  def edit
    @test = @question.test
  end

  def update
    if @question.update(question_params)
      redirect_to test_path(@question.test)
    else
      redirect_to :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to test_path(@question.test)
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def question
    @question = Question.find(params[:id])
  end

  def test
    @test = Test.find(params[:test_id])
  end
end
