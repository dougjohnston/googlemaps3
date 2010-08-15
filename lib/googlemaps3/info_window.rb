module GoogleMap3
  class InfoWindow
    attr_accessor :content, :disable_auto_pan, :max_width, :pixel_offset, :position, :z_index
    
    def initialize(content, position, options={})
      @content = content
      @position = position
      @disable_auto_pan = options[:disable_auto_pan]
      @max_width = options[:max_width]
      @pixel_offset = options[:pixel_offset]
      @z_index = options[:z_index]
    end
    
    def to_js
      "new google.maps.InfoWindow({ content: '#{@content}', position: #{@position.to_js} });"
    end
  end
end