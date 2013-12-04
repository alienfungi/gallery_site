class ContactMessagesController < ApplicationController
  before_action :set_contact_message, only: [:show]

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

  def index
    @contact_messages = ContactMessage.order('created_at DESC').paginate(page: params[:page])
  end

  def new
    @contact_message = ContactMessage.new
  end

  def show
  end

private

  def contact_message_params
    params.require(:contact_message).permit(:name, :email, :phone, :message)
  end

  def set_contact_message
    @contact_message = ContactMessage.find(params[:id])
  end

end
