require "rspec"
require_relative "../lib/node"

RSpec.describe Node do
  let(:subject) { Node.new("data") }

  describe "#data" do
    it "returns data given on initialization" do
      expect(subject.data).to eql("data")
    end
  end

  describe "#next_address" do
  end

  describe "#next_address=" do
  end
end
