class Player
  attr_reader :x, :y, :angle, :ssj
  def initialize(window)
    @image = Gosu::Image.new(window, "resources/images/calle.png", false)
    @x = @y = @vel_x = @vel_y = @angle = 0.0
    @score = 0
    @ssj = false

  end

  def warp(x, y)
    @x, @y = x, y
  end
  
  def turn_left
    @angle -= 4.5
  end
  
  def turn_right
    @angle += 4.5
  end
  
  def accelerate
    @vel_x += Gosu::offset_x(@angle, 0.5)
    @vel_y += Gosu::offset_y(@angle, 0.5)
  end

  def toggleSSJ(window)
	@ssj = !@ssj 
	@image = Gosu::Image.new(window, "resources/images/calle.png", false)
	if @ssj then
	    @image = Gosu::Image.new(window, "resources/images/callessj.png", false)
	end
        @zzj = @ssj
  end
  
  def move
    @x += @vel_x
    @y += @vel_y
    @x %= 640
    @y %= 480
    
    @vel_x *= 0.95
    @vel_y *= 0.95
  end

  def draw
    @image.draw_rot(@x, @y, 1, @angle)
  end
end
