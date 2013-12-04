class ContactMessagesController < ApplicationController

  def new
    @contact_message = ContactMessage.new
  end

  def create
    @contact_message = ContactMessage.new(contact_message_params)
    @contact_message.ip = request.remote_ip
    @valid = @contact_message.save

    notification = if @valid
      begin
        ContactMessageMailer.contact_message_email(@contact_message).deliver
        { success: "Message submitted." }
      rescue => e
        { error: "Message failed to submit." }
      end
    else
      { alert: "Invalid information." }
    end

    redirect_to :back, flash: notification
  end

private

  def contact_message_params
    params.require(:contact_message).permit(:name, :email, :phone, :message)
  end

end
