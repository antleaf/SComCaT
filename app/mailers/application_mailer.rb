class ApplicationMailer < ActionMailer::Base
  default from: ENV['SCOMCAT_MAILER_FROM']
  layout 'mailer'
end
