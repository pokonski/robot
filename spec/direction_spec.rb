require "spec_helper"

describe Direction do
  describe "#to_s" do
    it "returns human readable string with direction" do
      subject.x = -1
      subject.y = 0
      expect(subject.to_s).to eq("West")

      subject.x = 0
      subject.y = 1
      expect(subject.to_s).to eq("North")

      subject.x = 1
      subject.y = 0
      expect(subject.to_s).to eq("East")

      subject.x = 0
      subject.y = -1
      expect(subject.to_s).to eq("South")
    end
  end

  describe ".from_string" do
    it "returns Direction instance based on readable name" do
      expect(described_class.from_string("West")).to eq(Direction.new(-1, 0))
      expect(described_class.from_string("North")).to eq(Direction.new(0, 1))
      expect(described_class.from_string("East")).to eq(Direction.new(1, 0))
      expect(described_class.from_string("South")).to eq(Direction.new(0, -1))
    end
  end
end