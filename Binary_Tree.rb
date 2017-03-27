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

    def add(node, parent = @root) # Recursive,
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

    def breadth_first_search(target)
        queue = [@root]
        until queue.empty?
            i = queue.shift
            return puts "Node Found -> #{i}" if i.value == target
                queue << i.left unless i.left.nil?
                queue << i.right unless i.right.nil?
        end
        return puts 'Node not Found!'
    end


    def depth_first_search(target)
        stack = [@root]
        until stack.empty?
            i = stack.pop #index of current node
            return puts "Node Found ->#{i.to_s}" if target == i.value
            stack << i.left unless i.left.nil?
            stack << i.right unless i.right.nil?
        end
        puts "Node not Found"
    end

    def print_tree
        return nil if @root.nil?
        queue = [@root]
        loop do
            break if queue.empty?
            queue << queue[0].left unless queue[0].left.nil?
            queue << queue[0].right unless queue[0].right.nil?
            print queue.shift.value.to_s
        end
        puts ''
    end
end
array = [10, 9, 25, 8, 17, 6, 75, 2, 1, 35, 52, 40]
tree = Binary_Tree.new(array)
tree.print_tree
array.each { |v| tree.breadth_first_search(v) }
array.each { |v| tree.depth_first_search(v) }
array.each { |v| tree.dfs(v) }
