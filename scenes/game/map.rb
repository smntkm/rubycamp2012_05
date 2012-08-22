# coding: utf-8

require_relative 'point'
require_relative 'event'

class Map
  attr_reader :points

  def initialize
    map_file = File.join(File.dirname(__FILE__), "..", "..", "images", "map.png")
    @map_img = Image.load(map_file)
    @points = []
    @points << Point.new(940   , 46, "point.png")
    @points << Point.new(842   , 58, "point.png")
    @points << Point.new(641   , 121, "point.png")
    @points << Point.new(235   , 65, "point.png", event: Event.new)
    @points << Point.new(440   , 309, "point.png")
    @points << Point.new(182   , 461, "point.png")
    @points << Point.new(49   , 584, "point.png")
    @points << Point.new(135   , 697, "point.png")
    @points << Point.new(272   , 552, "point.png")
    @points << Point.new(427   , 456, "point.png")
    @points << Point.new(607   , 377, "point.png")
		@points << Point.new(678   , 315, "point.png")
		@points << Point.new(828   , 275, "point.png")
    @points << Point.new(934   , 207, "point.png", image: false)
  end

  def get_point_pos(pos)
    return @points[pos].x, @points[pos].y
  end

  def draw
    Window.draw(0, 0, @map_img)
    @points.each do |point|
      point.draw
    end
  end
end