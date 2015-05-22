ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
:address => "smtp.gmail.com",
:port => 587,
:domain => "mwsiq.com",
:user_name => "damdey",
:password => "Kaos1991",
:authentication => "plain",
:enable_starttls_auto => true
}