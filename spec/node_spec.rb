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
    it "sets the nex_address variable to the given value" do
      node = subject
      node.next_address = "next address"
      expect(node.next_address).to eql("next address")
    end
  end
end
