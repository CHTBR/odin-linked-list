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
    context "when given the number 8" do
      it "adds the given value to the end of the linked list" do
        linked_list = subject
        linked_list.append(8)
        expect(linked_list.tail).to eql(8)
      end
    end

    context "when given the symbol :e" do
      it "adds the given value to the end of the linked list" do
        linked_list = subject
        linked_list.append(:e)
        expect(linked_list.tail).to eql(:e)
      end
    end
  end

  describe "#prepend" do
    context "when given the boolean true" do
      it "adds the given value to the beginning of the linked list" do
        linked_list = subject
        linked_list.prepend(true)
        expect(linked_list.head).to eql(true)
      end
    end

    context "when given the the string \"value\"" do
      it "adds the given value to the beginning of the linked list" do
        linked_list = subject
        linked_list.prepend("value")
        expect(linked_list.head).to eql("value")
      end
    end
  end

  describe "#size" do
    context "given a LinkedList with 8 elements" do
      it "returns the correct size" do
        linked_list = LinkedList.new(["a", :b, 1, 6, false, "e", :x, 8])
        expect(linked_list.size).to eql(8)
      end
    end

    context "given a LinkedList with 12 elements" do
      it "returns the correct size" do
        linked_list = LinkedList.new(["a", :b, 1, 6, false, "e", :x, 8, "w", 43, 12, :l])
        expect(linked_list.size).to eql(12)
      end
    end
  end

  describe "#head" do
    context "given a LinkedList with elements :b, :c, :a, :d" do
      it "returns the head element" do
        linked_list = LinkedList.nwe(%i[b c a d])
        expect(linked_list.head).to eql(:b)
      end
    end

    context "given a LinkedList with elements 7, 3, 9, 1" do
      it "returns the head element" do
        linked_list = LinkedList.nwe([7, 3, 9, 1])
        expect(linked_list.head).to eql(7)
      end
    end
  end

  describe "#tail" do
    context "given a LinkedList with elements :b, :c, :a, :d" do
      it "returns the last element" do
        linked_list = LinkedList.nwe(%i[b c a d])
        expect(linked_list.head).to eql(:d)
      end
    end

    context "given a LinkedList with elements 7, 3, 9, 1" do
      it "returns the last element" do
        linked_list = LinkedList.nwe([7, 3, 9, 1])
        expect(linked_list.head).to eql(1)
      end
    end
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
    context "when we add the values 1, 2, 3" do
      it "returns a string containing all the elements in the LinkedList" do
        linked_list = LinkedList.new([1, 2, 3])
        expect(linked_list.to_s).to eql("1 -> 2 -> 3 -> nil")
      end
    end

    context "when we add the values 2, 3, 1" do
      it "returns a string containing all the elements in the LinkedList" do
        linked_list = LinkedList.new([2, 3, 1])
        expect(linked_list.to_s).to eql("2 -> 3 -> 1 -> nil")
      end
    end

    context "when we add values of different types" do
      it "returns a string with all the elements in the LinkedList properly converted to_s" do
        expect(subject.to_s).to eql("1 -> 2 -> a -> true -> nil")
      end
    end
  end

  describe "#insert_at" do
  end

  describe "#remove_at" do
  end
end
