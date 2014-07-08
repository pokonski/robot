require "spec_helper"

describe App do
  it "initializes new 5x5 board" do
    expect(Board).to receive(:new).with(5, 5)
    subject
  end

  describe "#move_robot" do
    context "robot placed on the board" do
      it "moves robot" do
        expect(subject.board).to receive(:move_robot)
        subject.place_robot(0, 1, "north")
        subject.move_robot
      end
    end
  end
end