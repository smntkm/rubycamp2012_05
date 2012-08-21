# coding: utf-8

class Point
  attr_accessor :x, :y

  def initialize(x, y, point_image, opt = {})
    @x = x
    @y = y
    @img_flag = opt[:image] || true
    @event = opt[:event]
    img_file = File.join(File.dirname(__FILE__), "..", "..", "images", "#{point_image}")
    @point_img = Image.load(img_file)
  end

  def event
    return false unless @event
    @event.exec
  end

  def draw
    Window.draw(@x, @y, @point_img) if @img_flag
  end

	def get_event
		return @event
	end
end