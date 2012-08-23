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
				point.draw(player_number) if point.visited_by == player_number && point.get_event
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

		current_player = @players[@current_player_num]
		
		#スペースキーを押したら画像の表示を消す
		if @stopping
			if Input.keyPush?(K_SPACE)
				current_player.check_event 0
				@stopping = false
			end
			return false
		end

		if @dicing
		  current_player.remove_all_event_pictures	
			@dice.rotate
			@dice.draw
			if Input.keyPush?(K_SPACE)
				@dicing = false
			end
		else
			unless current_player.map.points[current_player.pos % 29].visited_by == @current_player_num
				#current_player.check_event 1
				current_player.map.points[current_player.pos % 29].visited_by = @current_player_num
			end
			@dice.draw

			#行きたい方向を決める
			@direction = 0 if Input.keyPush?(K_UP) #上
			@direction = 1 if Input.keyPush?(K_DOWN)#下
			@direction = 2 if Input.keyPush?(K_LEFT) #左
			@direction = 3 if Input.keyPush?(K_RIGHT)#右

			if @direction
				@move_counter = @dice.current_num if @move_counter == 0
				@move_counter = @players[@current_player_num].move(@move_counter, @direction)
				if @move_counter <= 0
					@players[@current_player_num].check_event 1 #if @move_counter == 1
					@dicing = true
					@move_counter = 0
					@current_player_num += 1
					@current_player_num = 0 if @current_player_num == @players.size
				end
				@direction = nil
			end

			#プレイヤーの画像を表示
			@players.each do |player|
				player.draw
			end
		end
	end
end
