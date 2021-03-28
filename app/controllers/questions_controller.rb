class QuestionsController < ApplicationController
  # rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def show
    @question = Question.find(params[:id])
  end

  def new
    @test = Test.find(params[:test_id])
    @question = @test.questions.new
  end

  def create
    @test = Test.find(params[:test_id])
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to test_path(@test)
    else
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
    @test = @question.test
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to test_path(@question.test)
    else
      redirect_to :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to test_path(@question.test)
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  # def record_not_found
  #   render plain: "404 Not Found", status: 404
  # end
end
