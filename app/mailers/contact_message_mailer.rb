class ContactMessageMailer < ActionMailer::Base
  default from: "contactMessageMailer@zanewoodfin.com"

  def contact_message_email(contact_message)
    @contact_message = contact_message
    mail to: 'Zane Woodfin <zanewoodfin@gmail.com>',
      subject: "A message from zanewoodfin.com has arrived"
  end

end

