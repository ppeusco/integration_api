# frozen_string_literal: true

# app/lib/stack.rb
class Stack
  def initialize
    super()
    @store = []
  end

  def push(element)
    @store.push element
  end

  def pop
    @store.pop
  end

  def peek
    @store.last
  end

  def empty?
    @store.empty?
  end
end
