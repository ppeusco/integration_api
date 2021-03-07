class Stack
  attr_reader :store
  
  def initialize
    @store = []
  end

  def push(line)
    @store.push line
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
  
  def shift
    @store.shift
  end
end
