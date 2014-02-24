class NotificationsMailer < ActionMailer::Base
  default from: "noreply@elliotec.com"
  default to: "elliotecweb@gmail.com"

  def new_message(message)
    @message = message
    mail(:subject => "[elliotec.com] #{message.subject}")
  end

end
