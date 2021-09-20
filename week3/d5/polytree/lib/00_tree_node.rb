class PolyTreeNode
    attr_reader :parent, :children, :value
    def initialize(value)
        @parent=nil
        @children =[]
        @value=value
    end

    def parent=(node)
        #node== parent
        
        if node == nil
            @parent.children.reject { |child_node| child_node == self } 
            @parent = nil
        else
            if @parent != nil
                prev_parent = @parent
                prev_parent.children.reject { |child_node| child_node == self }
            end
            node.children.push(self) if !node.children.include?(self)
            @parent = node
        end
        
        # if node!=nil
        #     @parent =node
        #     node.children.push(self) if !node.children.include?(self)
        # else
        #     prev_parent = @parent
        #     prev_parent.children.reject { |child_node| child_node == self }
        #      @parent = node
        #     node.children.push(self)
        # end

    end

end