class MessageMailer < ApplicationMailer
  def messenger(message)
    @message = message
    mail(
      :from => "#{message.sender} <#{message.sender_email}>", 
      :to => "#{message.recipient} <#{message.recipient_email}>", 
      :subject => message.subject)
  end
end
