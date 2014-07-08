require "spec_helper"

describe App do
  it "initializes new 5x5 board" do
    expect(Board).to receive(:new).with(5, 5)
    subject
  end

  context "robot placed on the board" do
    before :each do
      subject.place_robot(0, 1, "north")
    end

    describe "#report" do
      it "returns string with formatted info about the robot" do
        expect($stdout).to receive(:puts).with("0,1,NORTH")
        subject.report
      end
    end

    describe "#move_robot" do
      it "moves robot" do
        expect(subject.board).to receive(:move_robot)
        subject.move_robot
      end
    end

    describe "#rotate_robot_left" do
      it "delegates robot rotation to the board" do
        expect(subject.board).to receive(:rotate_robot_left)
        subject.rotate_robot_left
      end
    end

    describe "#rotate_robot_right" do
      it "delegates robot rotation to the board" do
        expect(subject.board).to receive(:rotate_robot_right)
        subject.rotate_robot_right
      end
    end
  end

  describe "#place_robot" do
    it "delegates robot placing to the board" do
      expect(subject.board).to receive(:place_robot).with(1, 2, Direction.from_string("North"))
      subject.place_robot(1, 2, "North")
    end
  end
end