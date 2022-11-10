class EventMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.event_mailer.new_mail.subject
  #
  def send_mail(email_list, title, content)
    @content = content
    mail to: email_list, subject: title
  end
end
