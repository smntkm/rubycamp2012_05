# coding: utf-8

class Title
  def initialize
    bg_file = File.join(File.dirname(__FILE__), "..", "images", "opening.png")
    bg2_file = File.join(File.dirname(__FILE__), "..", "images", "logo.png")
    sound_file = File.join(File.dirname(__FILE__), "..", "sounds", "fanfare.wav")
    @background_img = Image.load(bg_file)
    @logo_img = Image.load(bg2_file)
    @sound = Sound.new(sound_file)
		@sound.setVolume(250, 0)
    @x = 0

   	@sub_title_font = Font.new(29, "ＭＳ ゴシック", weight: true)
    @sub_title_str = "シマネクエスト"
    

		
    @description_font = Font.new(32, "ＭＳ ゴシック", weight: true)
    @description_str = "～ルール～"
    
    @description2_font = Font.new(29, "ＭＳ ゴシック", weight: true)
    @description2_str = "サイコロをまわして、島根の観光名所を巡ろう!!"
    

    @description3_font = Font.new(29, "ＭＳ ゴシック", weight: true)
    @description3_str = "たくさん訪れた方が勝ちです."
    
    @description4_font = Font.new(30, "ＭＳ ゴシック", weight: true)
    @description4_str = "スペースキーを押したら、ゲームをはじめます."
end

  def play
    Window.draw(0, 0, @background_img)
    Window.draw(100, 130, @logo_img)

 
    Window.drawFont(420, 280, @sub_title_str, @sub_title_font, color: Util::RED)
		Window.drawFont(200, 380, @description_str, @description_font, color: Util::YELLOW)
    Window.drawFont(200, 420, @description2_str, @description2_font, color: Util::YELLOW)
    Window.drawFont(200, 460, @description3_str, @description3_font, color: Util::YELLOW)
    Window.drawFont(170, 700, @description4_str, @description4_font, color: Util::RED)
    
    if @x == 0
       @sound.play
       @x = 1
    end

   if Input.keyPush?(K_SPACE)
        @sound.stop
				Scene.set_scene(:game)
    end
  end
end
