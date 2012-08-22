# coding: utf-8

require_relative 'point'
require_relative 'event'

class Map
  attr_reader :points

  def initialize
    map_file = File.join(File.dirname(__FILE__), "..", "..", "images", "map.png")
    @map_img = Image.load(map_file)
    @points = []
    @points << Point.new(243, 65, "point.png", event: Event.new("matsuejo.png"))
    @points << Point.new(321, 125, "point.png")
    @points << Point.new(382, 166, "point.png")
    @points << Point.new(442, 217, "point.png")
    @points << Point.new(492, 262, "point.png")
    @points << Point.new(559, 210, "point.png")
    @points << Point.new(620, 144, "point.png", event: Event.new("matsuejo.png"))
    @points << Point.new(721, 124, "point.png")
    @points << Point.new(810, 109, "point.png", event: Event.new("matsuejo.png"))
    @points << Point.new(772, 152, "point.png")
    @points << Point.new(738, 192, "point.png", event: Event.new("matsuejo.png"))
		@points << Point.new(804, 195, "point.png")
		@points << Point.new(854, 199, "point.png")
		@points << Point.new(908, 200, "point.png", event: Event.new("matsuejo.png"))
		@points << Point.new(850, 259, "point.png")
		@points << Point.new(792, 302, "point.png", event: Event.new("matsuejo.png"))
		@points << Point.new(639, 379, "point.png")
		@points << Point.new(635, 274, "point.png")
		@points << Point.new(496, 448, "point.png")
		@points << Point.new(286, 545, "point.png")
		@points << Point.new(43, 641, "point.png", event: Event.new("matsuejo.png"))
		@points << Point.new(104, 588, "point.png")
		@points << Point.new(161, 537, "point.png", event: Event.new("matsuejo.png"))
		@points << Point.new(223, 481, "point.png")
		@points << Point.new(280, 442, "point.png", event: Event.new("matsuejo.png"))
		@points << Point.new(495, 363, "point.png")
		@points << Point.new(273, 329, "point.png")
		@points << Point.new(382, 297, "point.png")
    @points << Point.new(259, 213, "point.png", image: false)
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