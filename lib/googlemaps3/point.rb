module GoogleMap3
  class Point
    attr_accessor :lat, :lng
    
    def initialize(lat, lng)
      @lat = lat
      @lng = lng
    end
    
    def to_js
      "new google.maps.LatLng(#{@lat},#{@lng})"
    end
  end
end