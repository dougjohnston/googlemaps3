module GoogleMap3
  class Map
    attr_accessor :dom_id, :layers, :markers, :sensor, :center, :zoom
    
    def initialize(options = {})
      @dom_id = 'map_canvas'
      @layers = options[:layers] || []
      @markers = options[:markers] || []
      @sensor = options[:sensor] || false
      @center = options[:center] || GoogleMapConfig[:center] || [-34.397, 150.644]
      @zoom = options[:zoom] || GoogleMapConfig[:zoom] || 8
      
      # self.controls = [ :large, :scale, :type ]
      # self.double_click_zoom = true
      # self.continuous_zoom = false
      # self.scroll_wheel_zoom = false
    end
    
    def display
      "<div id='#{dom_id}' style='width: 100%; height: 100%'></div>"
    end
    
    def include_js
      %{
        <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
        <script type='text/javascript' src='http://maps.google.com/maps/api/js?sensor=#{sensor}'></script>
        <script type="text/javascript">#{initialize_map}</script>
      }
    end
    
    def resize
      return "#{dom_id}.checkResize();"
    end
    
  private
    def initialize_map
      %{
        var map;
        
        function initialize() {
          var latlng = new google.maps.LatLng(#{center[0]}, #{center[1]});
          var myOptions = {
            zoom: #{zoom},
            center: latlng,
            mapTypeId: google.maps.MapTypeId.ROADMAP
          };
          
          map = new google.maps.Map(document.getElementById("#{dom_id}"), myOptions);
          
          #{add_layers}
          #{add_markers}
        }
        
        google.maps.event.addDomListener(window, 'load', initialize);
      }
    end
    
    def add_layers
      @layers.map(&:to_js).flatten
    end
    
    def add_markers
      @markers.map(&:to_js).flatten
    end
  end
end