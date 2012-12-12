require 'devise_account_expireable/hooks/account_expireable'

module Devise
  module Models
    # Trace information about your user sign in. It tracks the following columns:

    # * resource_id
    # * sign_in_at
    # * sign_out_at
    
    module AccountExpireable
      extend  ActiveSupport::Concern

      def expired?
        expires_at.present? && expires_at < Date.now
      end

      def unauthenticated_message
        :account_expired
      end

      def self.required_fields(klass)
        attributes = []
        attributes << :expires_at
        attributes
      end

      def inactive_message
        expired? ? :account_expired : super
      end

      def valid_for_authentication?
        if super && !expired?
          true
        else
          false
        end
      end      
    end
  end
end