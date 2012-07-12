class UserMailer < ActionMailer::Base
	
  def registration_confirmation(user)  
    mail(:to => user.email, :subject => "Registration Successful.", :from => "rajkishan.m@gmail.com")  
  end

   def send_event_reminders(user)
    @user = user
    mail(:to => user.email, :subject => "Katching ! A Service Order has be identified in your area", :from => "rajkishan.m@gmail.com")
  end

end
