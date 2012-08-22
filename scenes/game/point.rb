# coding: utf-8

class Point
  attr_accessor :x, :y, :visited

  def initialize(x, y, opt = {})
    @x = x
    @y = y
    @img_flag = opt[:image] || true
    @event = opt[:event]
    #img_file = File.join(File.dirname(__FILE__), "..", "..", "images", "#{point_image}")
    #@point_img = Image.load(img_file)
    @visited = false
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

  def draw
    #Window.draw(@x, @y) if @img_flag
  end

  def get_event
	return @event
  end
end
