class Board
  attr_accessor :width, :height, :robot

  def initialize(width, height)
    @width = width
    @height = height
    @robot = nil
  end


  def move_robot
    @robot.move! if @robot.move_possible?(@width, @height)
  end

  def place_robot(x, y, direction)
    if x < 0 || y < 0 || x > width || y > height
      raise "Robot would fall down at this position"
    end
    @robot = Robot.new(x, y, direction)
  end

  def rotate_robot_left
    @robot.rotate_left!
  end

  def rotate_robot_right
    @robot.rotate_left!
  end
end