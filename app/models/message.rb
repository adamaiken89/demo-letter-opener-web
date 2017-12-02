class Message
  include ActiveModel::Model
 

  attr_accessor :content, :subject,
   :recipient, :recipient_email,
   :sender, :sender_email

  validates :content, :subject,
   :recipient, :recipient_email,
   :sender, :sender_email,
   presence: true
  validates_format_of :sender_email, with: /\A([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})\z/i, include_blank: nil
  validates_format_of :recipient_email, with: /\A([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})\z/i, include_blank: nil


  def deliver
    if valid?
      # deliver email
      MessageMailer.messenger(self).deliver_now
    end
  end
end