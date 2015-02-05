module EasyGravatar
  class JsonParser

    def initialize(json)
      @json = remove_first_layers(json)
    end

    def parse
      @json
    end

    private

    def remove_first_layers(json)
      json
    end
  end
end
