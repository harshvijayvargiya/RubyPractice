class SendConfirmationMailer < ApplicationMailer
    default_from: 'test.id.thoughtwin@gmail.com'
    
    def welcome_mail user
        @user = user
        @url = ' http://localhost:3000/users/new '
        mail to: @user.email, subject: "Verification mail"
    end
end
