require 'digest/md5'
require 'net/http'
require 'uri'

module EasyGravatar
  class Gravatar

    attr_reader :md5

    def initialize(email)
     @md5 = Digest::MD5.hexdigest(email.downcase)
    end

    def hash
      @hash ||= EasyGravatar::JsonParser.for(get_hash).parse
    end

    def full_name
      get_value :formattedName
    end

    def avatar(width = 80)
      "#{get_value(:thumbnailUrl)}?w=#{width}"
    end

    def get_value(key, subkey = nil)
      return '' unless hash[key]
      return '' if subkey and !hash[key][subkey]

      return hash[key][subkey] if subkey

      hash[key]
    end

    private

    def get_hash
      Net::HTTP.get(URI.parse(profile_url))
    end

    def profile_url(url = "https://www.gravatar.com/#{@md5}.json")
      response = Net::HTTP.get_response(URI.parse(url))

      case response
      when Net::HTTPSuccess then
        url
      when Net::HTTPRedirection then
        new_url = response['location']
        profile_url(new_url)
      end
    end
  end
end
