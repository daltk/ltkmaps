class UserMailer < ActionMailer::Base
	
  def registration_confirmation(user)  
    mail(:to => user.email, :subject => "Registration Successful.", :from => "rajkishan.m@gmail.com")  
  end

end
