require "spec_helper"

describe Robot do
  subject { described_class.new(0,0, Direction.new(-1, 0)) }

  it "sets instance variables from constructor" do
    robot = described_class.new(1,2, Direction.new(3, 4))

    expect(robot.x).to eq(1)
    expect(robot.y).to eq(2)
    expect(robot.direction.x).to eq(3)
    expect(robot.direction.y).to eq(4)
  end

  describe "#rotate_left!" do
    it "changes direction in place" do
      subject.rotate_left!

      expect(subject.direction.x).to eq(0)
      expect(subject.direction.y).to eq(-1)
    end
  end

  describe "#rotate_right!" do
    it "changes direction in place" do
      subject.rotate_right!

      expect(subject.direction.x).to eq(0)
      expect(subject.direction.y).to eq(1)
    end
  end


  describe "#move!" do
    it "moves the robot in the direction it looks at" do
      expect(subject.direction.x).to eq(-1)
      expect(subject.direction.y).to eq(0)

      expect(subject.x).to eq(0)
      expect(subject.y).to eq(0)

      subject.move!

      expect(subject.x).to eq(-1)
      expect(subject.y).to eq(0)
    end
  end

  describe "#readable_direction" do
    it "returns human readable direction" do
      expect(subject.direction).to receive(:to_s)
      subject.readable_direction
    end
  end
end