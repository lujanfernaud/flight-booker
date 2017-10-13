class ApplicationMailer < ActionMailer::Base
  default from: 'notifications@yawo.herokuapp.com'
  layout 'mailer'
end
