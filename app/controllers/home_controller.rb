class HomeController < ApplicationController
  def index
    @github_link = 'https://github.com/fgrehm/letter_opener_web'
    @message = Message.new(
     :subject => "This is the subject line",
     :content => "This is a test content for you to see the use of letter opener.\nI hope you can understand more through this simple example.",
     :recipient => 'Recipient', 
     :recipient_email => 'to@example.com',
     :sender => 'Sender',
     :sender_email => 'from@example.com',
    )
  end
end
