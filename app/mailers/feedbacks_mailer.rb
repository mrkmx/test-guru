class FeedbacksMailer < ApplicationMailer
  before_action { @mailer = params[:email] }

  def send_feedback(feedback)
    @feedback = feedback

    mail from: @mailer
    mail to: 'alex.a.maximow@gmail.com'
  end
end
