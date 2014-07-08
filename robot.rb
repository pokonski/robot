class Robot
  attr_accessor :x, :y, :direction

  DIRECTIONS = [
    Direction.new(-1, 0), # west
    Direction.new(0, 1),  # north
    Direction.new(1, 0),  # east
    Direction.new(0, -1)  # south
  ]

  def initialize(x, y, direction)
    @x = x
    @y = y
    @direction = direction
  end


  def rotate_right!
    @direction = DIRECTIONS[current_direction_index + 1] || DIRECTIONS[0]
  end

  def rotate_left!
    @direction = DIRECTIONS[current_direction_index - 1] || DIRECTIONS[3]
  end

  def move!
    @x += @direction.x
    @y += @direction.y
  end

  def readable_direction
    @direction.to_s
  end

  def move_possible?(board_width, board_height)
    new_x = @x + @direction.x
    new_y = @y + @direction.y

    new_x >= 0 &&
      new_x <= board_width &&
        new_y >= 0 &&
          new_y <= board_height
  end

  private

  def current_direction_index
    DIRECTIONS.index(@direction)
  end
end