# coding: utf-8

class Point
  attr_accessor :x, :y, :ref_point

  def initialize(x, y, point_image, opt = {})
    @x = x
    @y = y
    @img_flag = opt[:image] || true
    @event = opt[:event]
    blue_file = File.join(File.dirname(__FILE__), "..", "..", "images", "point_blue.png")
    red_file = File.join(File.dirname(__FILE__), "..", "..", "images", "point_red.png")
    @blue = Image.load(blue_file)
    @red = Image.load(red_file)
    @visited_by = nil
	@ref_point = []
  end

  def event flag = 1
		unless @event
    	return false
		end
		
		if flag == 1
    	@event.exec true
		else
			@event.exec false
		end
  end

  def draw(current_player_num)
	case current_player_num
	when 0
	  Window.draw(@x, @y, @blue) if @img_flag
	when 1
	  Window.draw(@x, @y, @red) if @img_flag
	end
  end

	def get_event
		return @event
	end
end
