require_relative "direction"
require_relative "board"
require_relative "robot"
require "pathname"

class App
  attr_reader :board

  def initialize
    @board = Board.new(5, 5)
  end

  def parse(input)
    input.lines.each do |line|
      puts "< #{line}"
      parse_command(line)
    end
  end

  def parse_file(path)
    data = Pathname.new(path).read
    parse(data)
  end

  def place_robot(x, y, direction)
    @board.place_robot(x, y, Direction.from_string(direction))
  end

  def move_robot
    @board.move_robot if robot_placed?
  end

  def rotate_robot_left
    @board.rotate_robot_left if robot_placed?
  end

  def rotate_robot_right
    @board.rotate_robot_right if robot_placed?
  end

  def report
    if robot_placed?
      puts "#{@board.robot.x},#{@board.robot.y},#{@board.robot.readable_direction.upcase}"
    end
  end

  def parse_command(input)
    line = input.downcase.split(" ")
    command = line.first

    case command
    when "place"
      arguments = line.last.split(",")
      place_robot(arguments[0].to_i, arguments[1].to_i, arguments[2])
    when "move"
      move_robot
    when "left"
      rotate_robot_left
    when "right"
      rotate_robot_right
    when "report"
      report
    end
  end

  private


  def robot_placed?
    puts "> Robot not placed" if @board.robot.nil?
    !@board.robot.nil?
  end
end