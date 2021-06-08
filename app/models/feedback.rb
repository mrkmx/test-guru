class Feedback
  include ActiveModel::Model

  attr_accessor :body, :email, :first_name, :last_name

  validates :body, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
