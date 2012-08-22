# coding: utf-8
require 'dxruby'

class Event

  def initialize event_pict
		explanation_file = File.join(File.dirname(__FILE__), "..","..", "event_picture", event_pict)
    @explanation_img = Image.load(explanation_file)
  end

  def exec flag
		@flag = flag
  end

	def draw
		Window.draw(300,200 , @explanation_img) if @flag
	end
end
