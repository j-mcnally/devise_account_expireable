require "devise_account_expireable/version"

require 'devise_account_expireable/rails'

unless defined?(Devise)
  require 'devise'
end

Devise.add_module :account_expireable, :model => 'devise_account_expireable/model'

module DeviseAccountExpireable
end
