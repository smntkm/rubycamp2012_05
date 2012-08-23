# coding: utf-8

class Player
  attr_accessor :map, :pos
  
  def initialize(map)
    @map = map
    @pos = rand(30)
    @x, @y = @map.get_point_pos(@pos.to_i)
    img_file = File.join(File.dirname(__FILE__), "..", "..", "images", "player.png")
    @img = Image.load(img_file)
    #@step = 0.1
  end

  def move(counter, direction)
    # 十字キーの入力を待つ
    # 十字キーの方向に対応する位置へ移動する
	  begin
		case direction 
		when 0
			point = @map.points[@pos.to_i].ref_point[0]
			@x, @y = point.x, point.y
		when 1
			point = @map.points[@pos.to_i].ref_point[1]
			@x, @y = point.x, point.y
		when 2
			point = @map.points[@pos.to_i].ref_point[2]
			@x, @y = point.x, point.y
		when 3
			point = @map.points[@pos.to_i].ref_point[3]
			@x, @y = point.x, point.y
		end
	  rescue
		 p 'error occured!!'
	  end
		@pos += 1
    #@x, @y = @map.get_point_pos(@pos.to_i)
    #if @pos.to_i == @map.points.size - 1
			#@pos = @pos.to_i % (@map.points.size -1)
			
      #Scene.set_scene(:ending)
    #end
    return counter - 1
  end

  def check_event flag
    @map.points[@pos.to_i % 29].event flag
  end

  def draw
    Window.draw(@x, @y, @img)
  end
end
