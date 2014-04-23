require 'gosu'

class Bird
  attr_accessor :x, :y, :dead

  def initialize(window)
    @image = Gosu::Image.new(window, "media/flappy.png", false)
    @window = window

    @angle = 0
    @gravity = 5
    @dead = false
    @x, @y = x, y

    reset
  end

  def reset
    @x = 320
    @y = 240
    @angle = 0
  end

  def update
    dead_if_touch_ground
    if @dead
      @y = 600
    else
      @angle += 2
      @angle = [@angle,90].min
      @y += @gravity

      if @window.button_down?(Gosu::KbSpace) then
        @y -= @gravity + 20
        @vel_y = 3
        @angle -= 10
        @angle = [@angle, -90].max
      end
    end
  end

  def dead_if_touch_ground
    if @y >= 600
      @dead = true
    end
  end

  def collision?(other)
    @y + @image.height/2 > other.y &&
    @y - @image.height/2 < other.y + other.height &&
    @x + @image.width/2  > other.x &&
    @x - @image.width/2  < other.x + other.width
  end

  def draw
    @image.draw_rot(@x, @y, 1, @angle)
  end
end