class PolyTreeNode
    attr_reader :parent, :children, :value
    def initialize(value)
        @parent=nil
        @children =[]
        @value=value
    end

    def parent=(node)
        #node== parent
        if node!=nil
            @parent =node
            node.children.push(self) if !node.children.include?(self)
        else
            return nil
        end
    end

end