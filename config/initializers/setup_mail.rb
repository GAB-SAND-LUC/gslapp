ActionMailer::Base.delivery_method = :smtp

if Rails.env.production?
  ActionMailer::Base.smtp_settings = {
    :address              => "smtp.mandrillapp.com",
    :port                 => 465,
    :domain               => "heroku.com",
    :user_name            => ENV['MANDRILL_USERNAME'],
    :password             => ENV['MANDRILL_APIKEY'],
    :authentication       => "plain",
    :ssl                  => true
  }
else
  ActionMailer::Base.smtp_settings = {
    :address              => "localhost",
    :port                 => 1025
  }
  ActionMailer::Base.default_url_options = { host: 'localhost:3000' }
end