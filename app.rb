require_relative "direction"
require_relative "board"
require_relative "robot"

class App
  attr_reader :board

  def initialize
    @board = Board.new(5, 5)
  end

  def place_robot(x, y, direction)
    @board.place_robot(x, y, Direction.from_string(direction))
  end

  def move_robot
    check_if_robot_placed
    @board.move_robot
  end

  def rotate_robot_left
    check_if_robot_placed
    @board.rotate_robot_left
  end

  def rotate_robot_right
    check_if_robot_placed
    @board.rotate_robot_right
  end

  def report
    check_if_robot_placed
    puts "#{@board.robot.x},#{@board.robot.y},#{@board.robot.readable_direction}"
  end

  private

  def check_if_robot_placed
    raise "Robot not placed on the board!" unless @board.robot
  end
end