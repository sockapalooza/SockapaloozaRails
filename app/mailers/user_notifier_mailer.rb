class UserNotifierMailer < ApplicationMailer
  default :from => 'SockAdmin@sockapolooza.com'

# send a signup email to the user, pass in the user object that   contains the user's email address
  def send_signup_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Welcome to Sockapolooza' )
  end

  def send_purchase_invoive(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Thank you for your purchase' )
  end
  
end
