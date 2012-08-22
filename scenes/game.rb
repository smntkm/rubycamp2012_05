# coding: utf-8

require_relative 'game/map'
require_relative 'game/player'
require_relative 'game/dice'

class Game

	attr_accessor :stopping

  def initialize
    @all_items = []
    @map = Map.new self
    #@players = [Player.new(@map), Player.new(@map)]
	@players = [Player.new(@map)]
    @current_player_num = 0
    @dice = Dice.new
    @dicing = true
    @move_counter = 0.0
		@stopping = false
  end

  def play
    @map.draw

	@players.each_with_index do |player, player_number|
		player.map.points.each do |point|
			point.draw(player_number) if point.visited_by == player_number && point.event
		end
	end

    @players.each do |player|
      player.draw
    end

	@map.points.each do |point|
		if point.get_event
			point.get_event.draw
		end
	end
		if @stopping
			if Input.keyPush?(K_SPACE)
				@players[@current_player_num].check_event 0
				@stopping = false
      end
			return false
		end

    if @dicing
      @dice.rotate
      @dice.draw
      if Input.keyPush?(K_SPACE)
        @dicing = false
		@players.each do |player|
			player.check_event 0
		end
      end
    else
      @dice.draw
      if Input.keyPush?(K_UP)
        @direction = 0
      end
			if Input.keyPush?(K_DOWN)
        @direction = 1
      end
			if Input.keyPush?(K_LEFT)
        @direction = 2
			end
			if Input.keyPush?(K_RIGHT)
				@direction = 3
			end
      #@move_counter = @dice.current_num if @move_counter == 0.0
	  #検証用　サイコロが常に１になる
	  if @move_counter == 0.0
        @move_counter = 1
	  end
      @move_counter = @players[@current_player_num].move(@move_counter)
      if @move_counter <= 0.0
		current_player = @players[@current_player_num]
		unless current_player.map.points[current_player.pos].visited_by == @current_player_num
          current_player.check_event 1
		  current_player.map.points[current_player.pos].visited_by = @current_player_num
		end
        @dicing = true
        @move_counter = 0.0
        @current_player_num += 1
        @current_player_num = 0 if @current_player_num == @players.size
      end
			if Input.keyPush?(K_RIGHT)
        @direction = 3
      end
      if @direction
        @move_counter = @dice.current_num if @move_counter == 0.0
  			#検証用　サイコロが常に１になる
  			#if @move_counter == 0.0
  			#	@move_counter = 1
  			#end
        @move_counter = @players[@current_player_num].move(@move_counter, @direction)
        if @move_counter <= 0.0
          @players[@current_player_num].check_event 1
          @dicing = true
          @move_counter = 0.0
          @current_player_num += 1
          @current_player_num = 0 if @current_player_num == @players.size
        end
        @direction = nil
      end
    end

    @players.each do |player|
      player.draw
    end
  end

end
