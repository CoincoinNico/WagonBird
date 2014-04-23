require 'gosu'

class Wall
  attr_accessor :x, :y, :wall_image

  def initialize(window)
    @wall_image = Gosu::Image.new(window, 'media/wall_down.png', true)
    @window = window
    #@offset_y = 35
    @x = 600
    @y = 600 - Random.new.rand(25..@wall_image.height )
  end

  def reset
    @x = 600
    @y = 600 - Random.new.rand(25..@wall_image.height )
  end

  def draw
    @wall_image.draw(@x, @y, 1)
  end

  def update
    @x -= 2
    if self.hide?
      self.reset
    end
  end

  def hide?
    if @x < 0
      true
    else
      false
    end
  end

  def height
    @wall_image.height
  end

  def width
    @wall_image.width
  end


end
