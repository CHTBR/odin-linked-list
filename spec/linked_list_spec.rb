require "rspec"
require_relative "../lib/linked_list"

RSpec.describe LinkedList do
  let(:subject) { LinkedList.new([1, "2", :a, true]) }

  describe "::new" do
    it "creates a linked list filled with the items from a given array" do
      expect(LinkedList.new([1, 2, 3].to_s)).to eql("1 -> 2 -> 3 -> nil")
    end
  end

  describe "#append" do
  end

  describe "#prepend" do
  end

  describe "#size" do
  end

  describe "#head" do
  end

  describe "#tail" do
  end

  describe "#at" do
  end

  describe "#pop" do
  end

  describe "#contains?" do
  end

  describe "#find" do
  end

  describe "#to_s" do
  end

  describe "#insert_at" do
  end

  describe "#remove_at" do
  end
end
