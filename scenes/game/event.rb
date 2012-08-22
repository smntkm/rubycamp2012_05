# coding: utf-8
require 'dxruby'

class Event
<<<<<<< HEAD
  def initialize
	explanation_file = File.join(File.dirname(__FILE__), "..","..", "images", "dice1.png")
=======
  def initialize event_pict
		explanation_file = File.join(File.dirname(__FILE__), "..","..", "event_picture", event_pict)
>>>>>>> 4ad194f00dc9578444d03fa9aa61cea3b29da252
    @explanation_img = Image.load(explanation_file)
  end

  def exec flag
		@flag = flag
  end

	def draw
		Window.draw(300,200 , @explanation_img) if @flag
	end
end
