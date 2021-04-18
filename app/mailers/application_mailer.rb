class ApplicationMailer < ActionMailer::Base
  default from: %{ 'Test Guru' <hello@my-domain.com> }
  layout 'mailer'
end
