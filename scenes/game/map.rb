# coding: utf-8

require_relative 'point'
require_relative 'event'

class Map
  attr_reader :points

  def initialize game
    map_file = File.join(File.dirname(__FILE__), "..", "..", "images", "map.png")
    @map_img = Image.load(map_file)
    @points = []
<<<<<<< HEAD
    @points << Point.new(243, 65, "point.png") #1
    @points << Point.new(321, 125, "point.png") #2
    @points << Point.new(382, 166, "point.png") #3
    @points << Point.new(442, 217, "point.png") #4
    @points << Point.new(492, 262, "point.png", event: Event.new("matsuejo.png", game)) #5
    @points << Point.new(559, 210, "point.png")
    @points << Point.new(620, 144, "point.png", event: Event.new("matsuejo.png" , game))
    @points << Point.new(721, 124, "point.png")
    @points << Point.new(810, 109, "point.png", event: Event.new("matsuejo.png", game))
    @points << Point.new(772, 152, "point.png") #10
    @points << Point.new(738, 192, "point.png", event: Event.new("matsuejo.png", game))
		@points << Point.new(804, 195, "point.png")
		@points << Point.new(854, 199, "point.png")
		@points << Point.new(908, 200, "point.png", event: Event.new("matsuejo.png", game))
		@points << Point.new(850, 259, "point.png") #15
		@points << Point.new(792, 302, "point.png", event: Event.new("matsuejo.png", game))
		@points << Point.new(639, 379, "point.png")
		@points << Point.new(635, 274, "point.png")
		@points << Point.new(496, 448, "point.png")
		@points << Point.new(286, 545, "point.png") #20
		@points << Point.new(43, 641, "point.png", event: Event.new("matsuejo.png", game))
		@points << Point.new(104, 588, "point.png")
		@points << Point.new(161, 537, "point.png", event: Event.new("matsuejo.png", game))
		@points << Point.new(223, 481, "point.png")
		@points << Point.new(280, 442, "point.png", event: Event.new("matsuejo.png", game)) #25
		@points << Point.new(495, 363, "point.png")
		@points << Point.new(273, 329, "point.png")
		@points << Point.new(382, 297, "point.png")
    @points << Point.new(259, 213, "point.png", image: false) #29
    @points << Point.new(243,  65, event: Event.new("rosoku.png"))
    @points << Point.new(321, 125)
    @points << Point.new(382, 166)
    @points << Point.new(442, 217)
    @points << Point.new(492, 262, event: Event.new("iwamiginzan.png"))
    @points << Point.new(559, 210)
    @points << Point.new(620, 144, event: Event.new("izumotaisha.png"))
    @points << Point.new(721, 124)
    @points << Point.new(810, 109, event: Event.new("matsuejo.png"))
    @points << Point.new(772, 152)
    @points << Point.new(738, 192, event: Event.new("tatara.png"))
		@points << Point.new(804, 195)
		@points << Point.new(854, 199)
		@points << Point.new(908, 200, event: Event.new("yasukibushi.png"))
		@points << Point.new(850, 259)
		@points << Point.new(792, 302, event: Event.new("soroban.png"))
		@points << Point.new(639, 379)
		@points << Point.new(635, 274)
		@points << Point.new(496, 448)
		@points << Point.new(286, 545)
		@points << Point.new( 43, 641, event: Event.new("ougai.png"))
		@points << Point.new(104, 588)
		@points << Point.new(161, 537, event: Event.new("grantowa.png"))
		@points << Point.new(223, 481)
		@points << Point.new(280, 442, event: Event.new("aquas.png"))
		@points << Point.new(495, 363)
		@points << Point.new(273, 329)
		@points << Point.new(382, 297)
    @points << Point.new(259, 213, image: false)
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
