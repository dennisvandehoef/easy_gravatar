# EasyGravatar

Gravatar.com, mainly known for its avatar hosting. But users can store more than only an avatar at gravatar.

This gem also allows you to easily access it all (accounts at other social networks, more photo's, the name of the user, saved websites, cryptocurrency accounts and more)

[![Gem Version](https://badge.fury.io/rb/easy_gravatar.svg)](http://badge.fury.io/rb/easy_gravatar)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'easy_gravatar'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install easy_gravatar

## Usage

Creating an instance is easy:
```ruby
user = EasyGravatar::Gravatar.new("foo@bar.com")
```

Or use the even shorter class Gravatar:
```ruby
user = Gravatar.new("foo@bar.com")
```

After creating an instance you can get some basics fast using
```ruby
user.full_name # => the full name of the user
user.avatar # => the avatar from the user, in the default gravatar width of 80 pixels
user.avatar(150) # => the avatar from the user, in with a width of 150 pixels
```
Feel free to contribute to the project and add your own "short getters".

All the available information is saved in a hash. Use `user.hash` to get the hash. As an alternative it is also possible to easily read from the hash.
```ruby
user.get_value(:formattedName) # => also gives the full name
user.get_value(:currency, :bitcoin) # => gives the users bitcoin address
```

## Contributing

1. Fork it ( https://github.com/dennisvandehoef/easy_gravatar/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
