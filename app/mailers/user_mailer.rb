class UserMailer < ActionMailer::Base
  default from: "no-reply@gslapp.com"

  def sending_resa(user)
    @user = user
    mail(to: @user.email, subject: 'You have just made a reservation!')
  end

  def receiving_resa(user, resa)
    @user = user
    @resa = resa
    mail(to: @user.email, subject: 'You have just received a reservation request!')
  end

end
