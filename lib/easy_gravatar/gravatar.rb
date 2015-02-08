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
      @hash ||= get_hash
    end

    private

    def get_hash
      url = "https://www.gravatar.com/#{@md5}.json"
      Net::HTTP.get(URI.parse(url))
    end
  end
end
