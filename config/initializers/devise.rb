# Use this hook to configure devise mailer, warden hooks and so forth.
# Many of these configuration options can be set straight in your model.
Devise.setup do |config|
  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'

  require 'devise/orm/active_record'
  config.case_insensitive_keys = [ :email ]
  config.strip_whitespace_keys = [ :email ]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 10
  config.reconfirmable = true
  config.password_length = 6..128
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete
  config.secret_key = '4cd8bbde3695ffc7ae2bd3daf66325620de3402ffd9ce9f9f33cb44c8452a85ae8323784841d6b125da7d4e2a8d1d109bfb09b2562ff6db36daccf652a8d23ca'
  config.omniauth :twitter, 'EO6X0ilq6rjEQHoO92wZ7Q', '8C1nTm2MwCJC1DgEn574ZvwlMS9Ygz3DfmxGXsfTcsI'
end
