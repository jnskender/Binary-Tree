class Node
    attr_accessor :value,:left,:right,:parent

    def initialize(value)
        @value = value
        @parent = nil
        @left = nil
        @right = nil
    end

    def to_s
      string = ""
      string += " Value: #{@value} "
      string += @parent.nil? ? "Root Node" : "Parent: #{@parent.value}"
      string += @left.nil? ? " Left: nil" : " Left: #{@left.value}"
      string += @right.nil? ? " Right: nil" : " Right: #{@right.value}"
      return string
    end



end
