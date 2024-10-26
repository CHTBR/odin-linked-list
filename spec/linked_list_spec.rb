require "rspec"
require_relative "../lib/linked_list"

RSpec.describe LinkedList do
  let(:subject) { LinkedList.new([1, "2", :a, true]) }

  describe "::new" do
    it "creates a linked list filled with the items from a given array" do
      expect(LinkedList.new([1, 2, 3]).to_s).to eql("1 -> 2 -> 3 -> nil")
    end
  end

  describe "#append" do
    context "when given a non-empty list" do
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

    context "when given an empty list" do
      before do
        @linked_list = LinkedList.new
      end

      context "when given the number 8" do
        it "adds the given value to the end of the linked list" do
          @linked_list.append(8)
          expect(@linked_list.tail).to eql(8)
        end
      end

      context "when given the symbol :e" do
        it "adds the given value to the end of the linked list" do
          @linked_list.append(:e)
          expect(@linked_list.tail).to eql(:e)
        end
      end
    end
  end

  describe "#list_prepend" do
    context "when given a non-empty list" do
      context "when given the boolean true" do
        it "adds the given value to the beginning of the linked list" do
          linked_list = subject
          linked_list.list_prepend(true)
          expect(linked_list.head).to eql(true)
        end
      end

      context "when given the the string \"value\"" do
        it "adds the given value to the beginning of the linked list" do
          linked_list = subject
          linked_list.list_prepend("value")
          expect(linked_list.head).to eql("value")
        end
      end
    end

    context "when given an empty list" do
      before do
        @linked_list = LinkedList.new
      end

      context "when given the boolean true" do
        it "adds the given value to the beginning of the linked list" do
          @linked_list.list_prepend(true)
          expect(@linked_list.head).to eql(true)
        end
      end

      context "when given the the string \"value\"" do
        it "adds the given value to the beginning of the linked list" do
          @linked_list.list_prepend("value")
          expect(@linked_list.head).to eql("value")
        end
      end
    end
  end

  describe "#size" do
    context "given an empty LinkedList" do
      it "returns the correct size" do
        linked_list = LinkedList.new
        expect(linked_list.size).to eql(0)
      end
    end

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
    context "given an empty list" do
      it "returns nil" do
        linked_list = LinkedList.new
        expect(linked_list.head).to eql(nil)
      end
    end

    context "given a LinkedList with elements :b, :c, :a, :d" do
      it "returns the head element" do
        linked_list = LinkedList.new(%i[b c a d])
        expect(linked_list.head).to eql(:b)
      end
    end

    context "given a LinkedList with elements 7, 3, 9, 1" do
      it "returns the head element" do
        linked_list = LinkedList.new([7, 3, 9, 1])
        expect(linked_list.head).to eql(7)
      end
    end
  end

  describe "#tail" do
    context "given an empty list" do
      it "returns nil" do
        linked_list = LinkedList.new
        expect(linked_list.tail).to eql(nil)
      end
    end

    context "given a LinkedList with elements :b, :c, :a, :d" do
      it "returns the last element" do
        linked_list = LinkedList.new(%i[b c a d])
        expect(linked_list.tail).to eql(:d)
      end
    end

    context "given a LinkedList with elements 7, 3, 9, 1" do
      it "returns the last element" do
        linked_list = LinkedList.new([7, 3, 9, 1])
        expect(linked_list.tail).to eql(1)
      end
    end
  end

  describe "#at" do
    it "returns nil when list is empty" do
      expect(LinkedList.new.at(0)).to eql(nil)
    end

    it "returns the head element as element at index 0" do
      expect(subject.at(0)).to eql(subject.head)
    end

    it "returns an element at any index" do
      expect(subject.at(2)).to eql(:a)
    end

    it "throws an error when passing incorrect value" do
      expect { subject.at("a") }.to raise_error(TypeError)
    end

    it "returns nil when requesting value out of range" do
      expect(subject.at(5)).to eql(nil)
    end
  end

  describe "#pop" do
    it "removes the last element from the array" do
      linked_list = subject
      tail_original = linked_list.tail
      linked_list.pop
      tail_new = linked_list.tail
      expect(tail_original).to_not eql(tail_new)
    end

    it "returns the popped element" do
      tail = subject.tail
      expect(subject.pop).to eql(tail)
    end

    it "throws an error when list is empty" do
      expect { LinkedList.new.pop }.to raise_error(EmptyList)
    end
  end

  describe "#contains?" do
    it "returns false when the list is empty" do
      expect(LinkedList.new.contains?("not an element")).to eql(false)
    end

    it "returns false when the list doesn't contain the value" do
      expect(subject.contains?("not an element")).to eql(false)
    end

    it "returns true when the list contains the value" do
      expect(subject.contains?(:a)).to eql(true)
    end
  end

  describe "#find" do
    it "returns nil if the list is empty" do
      expect(LinkedList.new.find("not an element")).to eql(nil)
    end

    it "returns nil if the list doesn't contain the value" do
      expect(subject.find("not an element")).to eql(nil)
    end

    it "returns the index of the value" do
      expect(subject.find(true)).to eql(3)
    end
  end

  describe "#to_s" do
    context "when given an empty list" do
      it "returns a string \"nil\"" do
        linked_list = LinkedList.new
        expect(linked_list.to_s).to eql("nil")
      end
    end


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
    it "assigns the element as head if the list is empty" do
      linked_list = LinkedList.new
      linked_list.insert_at(0, "inserted value")
      expect(linked_list.head).to eql("inserted value")
    end

    it "adds the element at the given index" do
      linked_list = subject
      linked_list.insert_at(2, "inserted value")
      expect(linked_list.at(2)).to eql("inserted value")
    end

    it "append the element if the index is greater than list size" do
      linked_list = subject
      linked_list.insert_at(5, "inserted value")
      expect(linked_list.tail).to eql("inserted value")
    end
  end

  describe "#remove_at" do
    it "removes the element at the given index" do
      linked_list = subject
      value_original = linked_list.at(1)
      linked_list.remove_at(1)
      value_new = linked_list.at(1)
      expect(value_original).to_not eql(value_new)
    end

    it "returns the removed element" do
      element = subject.at(0)
      expect(subject.remove_at(0)).to eql(element)
    end

    it "throws an error when removing value out of range" do
      expect { subject.remove_at(5) }.to raise_error(IndexOutOfRange)
    end

    it "throws an error when list is empty" do
      expect { LinkedList.new.remove_at(0) }.to raise_error(EmptyList)
    end
  end
end
