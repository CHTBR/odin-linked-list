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
    context "when we append the values 1, 2, 3" do
      it "returns a string containing all the elements in the LinkedList" do
        linked_list = LinkedList.new
        linked_list.append(1)
        linked_list.append(2)
        linked_list.append(3)
        expect(linked_list.to_s).to eql("1 -> 2 -> 3 -> nil")
      end
    end

    context "when we append the values 2, 3, 1" do
      it "returns a string containing all the elements in the LinkedList" do
        linked_list = LinkedList.new
        linked_list.append(2)
        linked_list.append(3)
        linked_list.append(1)
        expect(linked_list.to_s).to eql("2 -> 3 -> 1 -> nil")
      end
    end
  end

  describe "#insert_at" do
  end

  describe "#remove_at" do
  end
end
