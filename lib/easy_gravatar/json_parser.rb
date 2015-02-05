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
      hash.merge! strip_name_data
      hash.merge! strip_ims
      hash.merge! strip_phoneNumbers
      hash.merge! strip_currency
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

    def strip_ims
      strip_basic_group('ims')
    end

    def strip_phoneNumbers
      strip_basic_group('phoneNumbers')
    end

    def strip_currency
      strip_basic_group('currency')
    end

    def strip_name_data
      hash = Hash.new
      return hash unless @json['name']
      @json['name'].keys.each do |key|
        new_key = key
        new_key = "#{key}Name" if key == 'formatted'
        hash[new_key.to_sym] = @json['name'][key]
      end
      hash
    end

    def strip_basic_group(group)
      hash = Hash.new
      return hash unless @json[group]

      hash[group.to_sym] = Hash.new
      @json[group].each do |j|
        hash[group.to_sym][j['type'].to_sym] = j['value']
      end
      hash
    end

  end
end
