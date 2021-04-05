class AnswersController < ApplicationController
  before_action :question, only: %i[new create]
  before_action :answer, only: %i[show edit update destroy]

  def new
    @answer = @question.answers.new
  end

  def create
    @answer = @question.answers.new(answer_params)

    if @answer.save
      redirect_to @answer, notice: 'Ответ успешно создан'
    else
      render :new
    end
  end

  def update
    if @answer.update(answer_params)
      redirect_to @answer, notice: 'Ответ успешно обновлён'
    else
      render :edit
    end
  end

  def destroy
    @answer.destroy
    redirect_to @answer.question, notice: 'Ответ успешно удалён'
  end

  private

  def question
    @question = Question.find(params[:question_id])
  end

  def answer
    @answer = Answer.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:body, :correct)
  end
end
