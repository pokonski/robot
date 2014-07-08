require "spec_helper"

describe Board do
  subject { described_class }

  it "creates a board with given dimensions and no robot" do
    board = subject.new(5, 10)

    expect(board.width).to eq(5)
    expect(board.height).to eq(10)
    expect(board.robot).to be_nil
  end

  describe "#place_robot" do
    context "when placing robot outside the board" do
      it "raises error" do
        board = subject.new(5, 5)

        expect {subject.place_robot(-1, 5, Direction.new(-1, 0))}.to raise_error
        expect {subject.place_robot(5, 6, Direction.new(-1, 0))}.to raise_error
      end
    end

    context "when given correct coordinates" do
      it "places the robot on board" do
        board = subject.new(5, 5)

        board.place_robot(0, 0, Direction.new(-1, 0))
        expect(board.robot).to_not be_nil
      end
    end
  end
end