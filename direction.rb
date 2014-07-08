class Direction < Struct.new(:x, :y)
  def to_s
    case [x, y]
    when [-1, 0]
      "West"
    when [0, 1]
      "North"
    when [1, 0]
      "East"
    when  [0, -1]
      "South"
    end
  end


  def self.from_string(text)
    case text.downcase
    when "west"
      self.new(-1, 0)
    when "north"
      self.new(0, 1)
    when "east"
      self.new(1, 0)
    when "south"
      self.new(0, -1)
    end
  end
end