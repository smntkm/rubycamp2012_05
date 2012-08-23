# coding: utf-8

require_relative 'point'
require_relative 'event'

class Map
  attr_reader :x, :y, :points

  def initialize game
    map_file = File.join(File.dirname(__FILE__), "..", "..", "images", "map.png")
    @map_img = Image.load(map_file)
    @points = []
	@points << Point.new(243,  65, event: Event.new("rosoku.png", game)) #1
    @points << Point.new(321, 125)
    @points << Point.new(382, 166)
    @points << Point.new(442, 217)
    @points << Point.new(492, 262, event: Event.new("iwamiginzan.png", game)) #5
    @points << Point.new(559, 210)
    @points << Point.new(620, 144, event: Event.new("izumotaisha.png", game))
    @points << Point.new(721, 124)
    @points << Point.new(810, 109, event: Event.new("matsuejo.png", game))
    @points << Point.new(772, 152) #10
    @points << Point.new(738, 192, event: Event.new("tatara.png", game))
		@points << Point.new(804, 195)
		@points << Point.new(854, 199)
		@points << Point.new(908, 200, event: Event.new("yasukibushi.png", game))
		@points << Point.new(850, 259) #15
		@points << Point.new(792, 302, event: Event.new("soroban.png", game))
		@points << Point.new(639, 379)
		@points << Point.new(635, 274)
		@points << Point.new(496, 448)
		@points << Point.new(286, 545) #20
		@points << Point.new( 43, 641, event: Event.new("ougai.png", game))
		@points << Point.new(104, 588)
		@points << Point.new(161, 537, event: Event.new("grantowa.png", game))
		@points << Point.new(223, 481)
		@points << Point.new(280, 442, event: Event.new("aquas.png", game)) #25
		@points << Point.new(495, 363)
		@points << Point.new(273, 329)
		@points << Point.new(382, 297)
    @points << Point.new(259, 213, image: false) #29

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
	@points[4].ref_point[1] = @points[25]
	@points[4].ref_point[2] = @points[27]
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
	@points[21].ref_point[2] = @points[20]
	@points[21].ref_point[3] = @points[22]

	#23
	@points[22].ref_point[2] = @points[21]
	@points[22].ref_point[3] = @points[23]

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
	  return @points[pos % 29].x, @points[pos % 29].y
  end

  def draw
	  Window.draw(0, 0, @map_img)
	  # @points.each do |point|
	  #   point.draw
	  # end
  end

	def get_points_index(target)
		pos = @points.find_index{|point| point == target}
		return pos
	end
end
