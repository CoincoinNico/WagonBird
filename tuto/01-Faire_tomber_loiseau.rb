require 'gosu'

class Bird

  def initialize(window)
    @image = Gosu::Image.new(window, "media/flappy.png", false)
    @window = window

    @x = @window.width / 4
    @y = @window.height / 2

    @gravity = 1

  end

  def warp(x, y)
    @x, @y = x, y
  end

  def update

    @angle += 0.5
    @angle = [@angle,90].min
    @y += @gravity
  end

  def draw
    @image.draw_rot(@x, @y, 1, @angle)
  end
end