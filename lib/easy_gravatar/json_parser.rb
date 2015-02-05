require 'json'

module EasyGravatar
  class JsonParser

#    attr_accessor :json

    def self.for(json)
      new json
    end

    def initialize(json = '')
      @json = remove_first_layers(json)
    end

    def parse
      hash = strip_basic_fields
      hash.merge strip_currency
    end

    private

    def remove_first_layers(json)
      JSON.parse(json)['entry'][0]
    end

    def strip_basic_fields
      hash = Hash.new
      @json.keys.each do |key|
        hash[key.to_sym] = @json[key] if @json[key].class == String
      end
      hash
    end

    def strip_currency
      hash = Hash.new
      return hash unless @json['currency']

      hash[:currency] = Hash.new
      @json['currency'].each do |j|
        hash[:currency][j['type'].to_sym] = j['value']
      end
      hash
    end

  end
end
