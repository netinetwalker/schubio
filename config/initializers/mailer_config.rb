Schubio::Application.configure do
  config.action_mailer.default_url_options = {:host => AppConfig[:host]}
  config.action_mailer.smtp_settings = {
    :address => AppConfig[:smtp_address],
    :port => AppConfig[:smtp_port],
    :domain => AppConfig[:smtp_domain],
    :authentication => AppConfig[:smtp_authentication],
    :user_name => AppConfig[:smtp_username],
    :password => AppConfig[:smtp_password],
    :enable_starttls_auto => AppConfig[:smtp_starttls_auto],
    :openssl_verify_mode => AppConfig[:smtp_openssl_verify_mode]
  }
end


