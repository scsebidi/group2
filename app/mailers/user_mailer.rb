class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def contact(recipient, subject, message, sent_at = Time.now)
      @subject = subject
      @recipients = recipient
      @from = 'no-reply@fxluxuryshop.com'
      @sent_on = sent_at
	  @body["title"] = 'Title'
  	  @body["email"] = 'sender@yourdomain.com'
   	  @body["message"] = message
      @headers = {}
   end
end

