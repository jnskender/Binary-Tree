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
        if node.value < parent.value # Go to the left
            if parent.left.nil?
                parent.left = node
                parent.left.parent = parent
            else
                add(node, parent.left)
            end
        elsif node.value > parent.value # Go to the right
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
            current_node = queue.shift
            return puts "Node Found -> #{current_node}" if current_node.value == target
            queue << current_node.left unless current_node.left.nil?
            queue << current_node.right unless current_node.right.nil?
        end
        puts 'Node not Found!'
    end

    def depth_first_search(target)
        stack = [@root]
        until stack.empty?
            current_node = stack.pop # index of current node
            return puts "Node Found ->#{current_node}" if target == current_node.value
            stack << current_node.left unless current_node.left.nil?
            stack << current_node.right unless current_node.right.nil?
        end
        puts 'Node not Found!'
    end

    def dfs_recursive(target, current_node = @root)
        return puts "Node Found -> #{current_node}" if current_node.value == target
        unless current_node.left.nil?
            result = dfs_recursive(target, current_node.left)
            return result unless result.nil?
        end
        unless current_node.right.nil?
            result = dfs_recursive(target, current_node.right)
            return result unless result.nil?
        end
        nil
    end

    #     def print_tree #for initial testing only
    #         return nil if @root.nil?
    #         queue = [@root]
    #         loop do
    #             break if queue.empty?
    #             queue << queue[0].left unless queue[0].left.nil?
    #             queue << queue[0].right unless queue[0].right.nil?
    #             print "#{queue.shift.value} "
    #         end
    #         puts ''
    #     end
end
array = [10, 9, 25, 8, 17, 6, 75, 2, 1, 35, 52, 40]
tree = Binary_Tree.new(array.shuffle)

array.each { |v| tree.breadth_first_search(v) } # test to find all values in tree
array.each { |v| tree.depth_first_search(v) }
array.each { |v| tree.dfs_recursive(v) }
tree.breadth_first_search(9_999_999) # Test for search fail
tree.depth_first_search(9_999_999) # Test for search fail
tree.dfs_recursive(9_999_999) # Test for search fail
