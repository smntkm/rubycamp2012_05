# coding: utf-8
require 'dxruby'

class Event
<<<<<<< HEAD
  def initialize event_pict, game
		explanation_file = File.join(File.dirname(__FILE__), "..","..", "event_picture", event_pict)
=======
  def initialize event_pict
	explanation_file = File.join(File.dirname(__FILE__), "..","..", "event_picture", event_pict)
>>>>>>> 9fd9c9a8218cf5832993760673a2287ad4782804
    @explanation_img = Image.load(explanation_file)
		@game = game
  end

  def exec flag
<<<<<<< HEAD
		@flag = flag
		@game.stopping = true
=======
	@flag = flag
>>>>>>> 9fd9c9a8218cf5832993760673a2287ad4782804
  end

  def draw
	Window.draw(300,200 , @explanation_img) if @flag
  end
end
