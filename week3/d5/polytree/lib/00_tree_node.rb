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
                @parent.children.reject! { |child_node| child_node == self }
            end
            node.children.push(self) if !node.children.include?(self)
            #node.add_child(self) if !node.children.include?(self)
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
    def add_child(child_node)
        child_node.parent=(self)
    end

    def remove_child(child_node)
        child_node.parent=(nil)
    end

    require 'byebug'
    def dfs(target_value)
        # if child's parent is not checked 
        return self if self.value == target_value
        # return nil if self.empty?
    # debugger    
        self.children.each do |child_node| 
            result = child_node.dfs(target_value)
            return result if result != nil
        end
        nil
    end

    def bfs(target_value)
        queue=[self]
        #return self if target_value== self.value
        while !queue.empty?
            ele= queue.shift
            if ele.value == target_value
                return ele
            else
                queue+= ele.children
            end
        end
        nil
    end
end
