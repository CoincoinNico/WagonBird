require 'gosu'
require_relative 'lib/bird.rb'
require_relative 'lib/wall.rb'
require_relative 'lib/wallfactory.rb'



class GameWindow < Gosu::Window
  attr_accessor :array

  def initialize (width, height, fullscreen)
    super(width, height, fullscreen)
    self.caption = "My own flappy !"
    @background_image = Gosu::Image.new(self, "media/background.png", true)

    @bird = Bird.new(self)
    @wall = Wall.new(self)

    @start = false

    @array = [@bird]
  end

  def reset
    @bird = Bird.new(self)
    @wall = Wall.new(self)
    @array = [@bird, @wallfactory]
  end

  def update
    if @start
      if @bird.dead == true || @bird.collision?(@wall)
        @start = false
      else
        @bird.update
        @wall.update
      end
    else
      @start = true, reset if self.button_down?(Gosu::KbSpace)
    end
  end

  def draw
    @bird.draw
    @background_image.draw(0, 0, 0)
    @wall.draw
  end

  def button_down(id)
    if id == Gosu::KbEscape
      close
    end
  end
end


game_window = GameWindow.new(800, 600, false)

game_window.show

