class Answer < ApplicationRecord
  belongs_to :question, optional: true
  belongs_to :user, optional: true
end
