module GoogleMap3
  class Layer
    attr_accessor :url
    
    def initialize(url)
      @url = url
    end
    
    def to_js
      "var layer = new google.maps.KmlLayer('#{@url}'); layer.setMap(map);"
    end
  end
end