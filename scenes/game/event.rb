# coding: utf-8
require 'dxruby'

class Event
  def initialize
	explanation_file = File.join(File.dirname(__FILE__), "..","..", "images", "dice1.png")
    @explanation_img = Image.load(explanation_file)
  end

  def exec
		@flag = true
  end

	def draw
		Window.draw(300,200 , @explanation_img) if @flag
	end
end
