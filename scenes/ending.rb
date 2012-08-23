# coding: utf-8
require 'dxruby' 
class Ending

	attr_accessor :foo

 def initialize
    bg_file = File.join(File.dirname(__FILE__), "..", "images", "ending_back.png")
		sound_file = File.join(File.dirname(__FILE__), "..", "sounds", "jingle-090610-fanfare01-wav.wav")
    @background_img = Image.load(bg_file)
		@sound = Sound.new(sound_file)
		@score1 = 0
		@score2 = 0
		@x = 0

    @title_font = Font.new(64, "ＭＳ ゴシック", weight: true)
    @title_str = "ゲーム終了！！"
    @title_x = Util.get_center(@title_str, @title_font)

    @result_font = Font.new(34, "ＭＳ ゴシック", weight: true)
    @result_str = "～結果～"
   

		
    @result2_font = Font.new(34, "ＭＳ ゴシック", weight: true)
    @result2_str = "プレイヤー1：#{@score1}"
    
		@result3_font = Font.new(34, "ＭＳ ゴシック", weight: true)
    @result3_str = "プレイヤー2：#{@score2}"
   
		@result4_font = Font.new(44, "ＭＳ ゴシック", weight: true)
    @result4_str = "～勝者～"

		@result5_font = Font.new(44, "ＭＳ ゴシック", weight: true)
    @result5_str = "プレイヤー１ おめでとう!!"

		@result6_font = Font.new(44, "ＭＳ ゴシック", weight: true)
    @result6_str = "プレイヤー２ おめでとう!!"



    @description_font = Font.new(24, "ＭＳ ゴシック", weight: true)
    @description_str = "リターンキーを押して終了します"
    @description_x = Util.get_center(@description_str, @description_font)
  end

  def play

		@foo.each do | point |
				if @score1 + @score2 < 10
					@score1 += 1 if point.visited_by == 0
					@score2 += 1 if point.visited_by == 1
				end
		end

    Window.draw(0, 0, @background_img)
    Window.drawFont(@title_x, 60, @title_str, @title_font, color: Util::YELLOW)
    Window.drawFont(260, 200, @result_str, @result_font, color: Util::YELLOW)
  	Window.drawFont(250, 250, "プレイヤー1：#{@score1}", @result2_font, color: Util::YELLOW)
    Window.drawFont(250, 320, "プレイヤー2：#{@score2}", @result3_font, color: Util::YELLOW)
		Window.drawFont(170, 430, @result4_str, @result4_font, color: Util::RED)
		
		if @score1 > @score2
					Window.drawFont(170, 500, @result5_str, @result5_font, color: Util::RED)
		else
					Window.drawFont(170, 500, @result6_str, @result6_font, color: Util::RED)
		end

		if @x == 0
  		 @sound.play
     	 @x = 1
		end
		
	
		if Input.keyPush?(K_RETURN)
			exit
		end
  end
end