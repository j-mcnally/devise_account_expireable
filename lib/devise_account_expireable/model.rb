module Devise
  module Models
    # Trace information about your user sign in. It tracks the following columns:

    # * resource_id
    # * sign_in_at
    # * sign_out_at
    
    module AccountExpireable
      extend  ActiveSupport::Concern

      def expired?
        expires_at.present? && expires_at < DateTime.now
      end



      def self.required_fields(klass)
        attributes = []
        attributes << :expires_at
        attributes
      end
      def access_locked?
        expired?
      end
      def active_for_authentication?
        super && !expired?
      end

      def inactive_message
        expired? ? :account_expired : super
      end
    end
  end
end