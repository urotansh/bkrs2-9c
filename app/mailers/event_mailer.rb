class EventMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.event_mailer.new_mail.subject
  #
  def new_mail
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
