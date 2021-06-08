class FeedbacksController < ApplicationController
  # respond_to :html

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)

    if @feedback.valid?
      FeedbacksMailer.with(email: @feedback.email).send_feedback(@feedback).deliver_now
      redirect_to root_path, notice: t('.success')
    else
      flash.now[:alert] = t('.failure')
      render :new
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:body, :email, :first_name, :last_name)
  end
end
