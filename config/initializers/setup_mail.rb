ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "gmail.com",
  :user_name            => "sowcarmatec@gmail.com",
  :password             => "poiuqaz123",
  :authentication       => "plain",
  :enable_starttls_auto => true
}