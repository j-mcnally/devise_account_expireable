# DeviseAccountExpireable

## Installation

Add this line to your application's Gemfile:

    gem 'devise_account_expireable'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install devise_account_expireable

## Usage

1. Install the migration: `rails g devise_account_expireable`
2. `rake db:migrate`
3. Add `:account_expireable` to the devise line of you account (User) model.
`devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :account_expireable`
4. Add a way through your admin panel of setting the attribute `:expires_at` to a date/time on the account (User) model.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
