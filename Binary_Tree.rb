require './Node.rb'
class Binary_Tree
    attr_accessor :root

    def initialize(array)
        @root = nil
        build_tree(array)
    end

    def build_tree(array)
        array.each do |value|
            node = Node.new(value)
            add(node)
        end
    end

    def add(node, parent = @root) #Recursive,
        return @root = node if @root.nil?
        if node.value < parent.value
            if parent.left.nil?
                parent.left = node
                parent.left.parent = parent
            else
                add(node, parent.left)
            end
        elsif node.value > parent.value
            if parent.right.nil?
                parent.right = node
                parent.right.parent = parent
            else
                add(node, parent.right)
            end
        end
    end # end build_tree

    def breadth_first_search(search)
        queue = [@root]
        found = false
        until found
            if queue[0].value == search
                found = true
                return puts "Node Found! -> #{queue[0].to_s}"
            else
                queue << queue[0].left unless queue[0].left.nil?
                queue << queue[0].right unless queue[0].right.nil?
                queue.shift
                return puts "Node not Found!" if queue.empty?
            end
        end
    end

    def depth_first_search(search)
      #Check root for search
      #Go left and check for search.
      stack = []
      #check left side
      i = @root
      until i.nil?
        if i.value == search
          return puts "Node Found! #{i.to_s}"
        else
          stack << i.left
          i = i.left
        end
      end

      loop do
        break if stack.empty?
          match = stack.shift
          puts "Found Node! #{match}" if match == search
      end

      #check right side
      i = @root
      until i.nil?
        if i.value == search
          return puts "Node Found! #{i.to_s}"
        else
          stack << i.right
          i = i.right
        end
      end

      loop do
        break if stack.empty?
          match = stack.shift
          puts "Found Node! #{match}" if match == search
      end

      return puts "Node not found!"
    end

    def print_tree
        return nil if @root.nil?
        queue = [@root]
        loop do
            break if queue.empty?
            queue << queue[0].left unless queue[0].left.nil?
            queue << queue[0].right unless queue[0].right.nil?
            print "#{queue.shift.value}"
        end
        puts ''
    end
end
array = [3, 2, 4, 1, 5]
tree = Binary_Tree.new(array)
tree.print_tree
array.each {|v| tree.breadth_first_search(v)}
array.each {|v| tree.depth_first_search(v)}
tree.depth_first_search(12)
