module Devise
  module Models
    # Allow for expiration date on Devise resources. Adds attribute:

    # * expires_at

    module AccountExpireable
      extend  ActiveSupport::Concern

      def expired?
        expires_at.present? && expires_at < DateTime.now
      end

      def expire_now
        expire_at
      end

      def expire_now!
        expire_at!
      end

      def unexpire_now
        expire_at nil
      end

      def unexpire_now!
        expire_at! nil
      end

      def expire_at(date_time = DateTime.now)
        self.expires_at = date_time
      end

      def expire_at!(date_time = DateTime.now)
        expire_at(date_time)
        save
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

      # Overwrites valid_for_authentication? from Devise::Models::Authenticatable
      # for verifying whether a user is allowed to sign in or not. If the user
      # is locked, it should never be allowed.
      def valid_for_authentication?
        if super && !expired?
          true
        else
          false
        end
      end

      def unauthenticated_message
        # If set to paranoid mode, do not show the locked message because it
        # leaks the existence of an account.
        if Devise.paranoid
          super
        elsif expired?
          :account_expired
        else
          super
        end
      end
    end
  end
end