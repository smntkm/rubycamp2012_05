# coding: utf-8

class Player
  def initialize(map, x = 250, y = 25)
    @map = map
    @x = x
    @y = y
    @pos = 0.0
    img_file = File.join(File.dirname(__FILE__), "..", "..", "images", "player.png")
    @img = Image.load(img_file)
    #@step = 0.1
  end

  def move(counter, direction)
    # �\���L�[�̓��͂�҂�
    # �\���L�[�̕����ɑΉ�����ʒu�ֈړ�����
		case direction 
		when 0
      p point = @map.points[@pos.to_i].ref_point[0]
			@x, @y = point.x, point.y
		when 1
			p @map.points[@pos.to_i].ref_point[1].class
			@x, @y = point.x, point.y
		when 2
			p point = @map.points[@pos.to_i].ref_point[2]
			@x, @y = point.x, point.y
		when 3
			p point = @map.points[@pos.to_i].ref_point[3]
			@x, @y = point.x, point.y
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
    @map.points[@pos.to_i].event flag
  end

  def draw
    Window.draw(@x, @y, @img)
  end
end