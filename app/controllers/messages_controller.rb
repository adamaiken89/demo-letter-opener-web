class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @result = @message.valid?
    if @result
      @message.deliver
    end
    respond_to do |format|
      format.js { render :layout => false }# just renders messages/create.js.erb
    end
  end

  private

    def message_params
      params.
        require(:message).
        permit(
          :subject,
          :content,
          :recipient,
          :recipient_email,
          :sender,
          :sender_email,
        )
    end
end
