class ApplicationMailer < ActionMailer::Base
  default from: %{ 'Test Guru' <alex.a.maximow@gmail.com> }
  layout 'mailer'
end
