# DeviseAccountExpireable

## Installation

Add this line to your application's Gemfile:

    gem 'devise_account_expireable'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install devise_account_expireable

## Setup and Configuration

1. Generate the migration

```
$ rails g devise_account_expireable`
```

2. Migrate

```
$ rake db:migrate
```

3. Add `:account_expireable` to the devise line of you account (`User`) model.

```ruby
devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :account_expireable`
```

4. (Optional) Add a way through your admin panel of setting the attribute `:expires_at` to a date/time (`DateTime`) on the account (`User`) model.

## Expiring and Unexpiring a User account

If you want to expire User u1 now, without immediate persistence to DB:

```ruby
u1.expire_now
```

If you want to expire User u1 now, with immediate persistence to DB:

```ruby
u1.expire_now!
```

If you want to expire User u1 at a future DateTime (like DateTime.now.end_of_day), without immediate persistence to DB:

```ruby
u1.expire_at DateTime.now.end_of_day
```

If you want to expire User u1 at a future DateTime (like DateTime.now.end_of_day), with immediate persistence to DB:

```ruby
u1.expire_at! DateTime.now.end_of_day
```

If you want to unexpire User u1 now, without immediate persistence to DB:

```ruby
u1.unexpire_now
```

If you want to unexpire User u1 now, with immediate persistence to DB:

```ruby
u1.unexpire_now!
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
