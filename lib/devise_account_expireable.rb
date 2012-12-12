require "devise_account_expireable/version"


unless defined?(Devise)
  require 'devise'
end

require 'devise_account_expireable'

Devise.add_module :account_expireable, :model => 'devise_account_expireable/model'


module DeviseAccountExpireable
end

require 'devise_account_expireable/rails'