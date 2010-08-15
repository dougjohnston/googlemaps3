module GoogleMap3
  class Marker
    attr_accessor :position, :map, :title, :info_window
    
    def initialize(position, options={})
      return unless position.is_a?(Point)
      
      @position = position
      @map = options[:map] || 'map'
      @title = options[:title]
      @info_window = options[:info_window]
    end
    
    def to_js
      %{
        var point = #{position.to_js}; 
        var marker = new google.maps.Marker({ position: point, map: #{@map}, title: '#{@title}' });
          
        var infowindow = #{@info_window.to_js}
        #{click_event}
      }
    end
    
    def click_event
      %{
        google.maps.event.addListener(marker, 'click', function() {
          infowindow.open(map,marker);
        });
      }
    end
  end
end