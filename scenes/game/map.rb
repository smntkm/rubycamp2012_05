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
    @points << Point.new(492, 262, "point.png", event: Event.new("matsuejo.png"))
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

		#1
    @points[0].ref_point[3] = @points[1]
		@points[0].ref_point[1] = @points[28]

    #2
		@points[1].ref_point[2] = @points[0]
    @points[1].ref_point[3] = @points[2]

		#3
    @points[2].ref_point[2] = @points[1]
    @points[2].ref_point[3] = @points[3]

		#4
    @points[3].ref_point[2] = @points[2]
    @points[3].ref_point[3] = @points[4]

		#5
    @points[4].ref_point[0] = @points[3]
    @points[4].ref_point[1] = @points[15]
    @points[4].ref_point[2] = @points[28]
    @points[4].ref_point[3] = @points[5]

    #6
		@points[5].ref_point[2] = @points[4]
    @points[5].ref_point[3] = @points[6]

		#7
    @points[6].ref_point[1] = @points[17]
    @points[6].ref_point[2] = @points[5]
    @points[6].ref_point[3] = @points[7]

		#8
		@points[7].ref_point[2] = @points[6]
    @points[7].ref_point[3] = @points[8]

		#9
    @points[8].ref_point[1] = @points[9]
    @points[8].ref_point[2] = @points[7]

		#10
    @points[9].ref_point[0] = @points[8]
    @points[9].ref_point[1] = @points[10]

		#11
    @points[10].ref_point[0] = @points[9]
    @points[10].ref_point[2] = @points[17]
    @points[10].ref_point[3] = @points[11]

		#12
    @points[11].ref_point[2] = @points[10]
    @points[11].ref_point[3] = @points[12]

		#13
    @points[12].ref_point[2] = @points[11]
    @points[12].ref_point[3] = @points[13]
    
		#14
		@points[13].ref_point[1] = @points[14]
    @points[13].ref_point[2] = @points[12]

    #15
		@points[14].ref_point[0] = @points[13]
    @points[14].ref_point[2] = @points[15]

		#16
		@points[15].ref_point[2] = @points[16]
		@points[15].ref_point[3] = @points[14]

		#17
		@points[16].ref_point[0] = @points[17]
		@points[16].ref_point[2] = @points[18]
		@points[16].ref_point[3] = @points[15]

		#18
		@points[17].ref_point[0] = @points[6]
		@points[17].ref_point[1] = @points[16]
		@points[17].ref_point[3] = @points[10]

		#19
		@points[18].ref_point[0] = @points[25]
		@points[18].ref_point[2] = @points[19]
		@points[18].ref_point[3] = @points[16]

		#20
		@points[19].ref_point[0] = @points[24]
		@points[19].ref_point[2] = @points[20]
		@points[19].ref_point[3] = @points[18]

		#21
		@points[20].ref_point[0] = @points[21]
		@points[20].ref_point[3] = @points[19]

		#22
		@points[21].ref_point[2] = @points[22]
		@points[21].ref_point[3] = @points[20]

		#23
		@points[22].ref_point[2] = @points[23]
		@points[22].ref_point[3] = @points[21]

		#24
		@points[23].ref_point[2] = @points[22]
		@points[23].ref_point[3] = @points[24]

		#25
		@points[24].ref_point[0] = @points[26]
		@points[24].ref_point[1] = @points[19]
		@points[24].ref_point[2] = @points[23]
		@points[24].ref_point[3] = @points[25]

		#26
		@points[25].ref_point[0] = @points[4]
		@points[25].ref_point[1] = @points[18]
		@points[25].ref_point[2] = @points[24]

		#27
		@points[26].ref_point[0] = @points[28]
		@points[26].ref_point[1] = @points[24]
		@points[26].ref_point[3] = @points[27]

		#28
		@points[27].ref_point[2] = @points[26]
		@points[27].ref_point[3] = @points[4]

		#29
		@points[28].ref_point[0] = @points[0]
		@points[28].ref_point[1] = @points[26]

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