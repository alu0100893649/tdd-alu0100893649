Node = Struct.new(:value, :next, :prev)

class Lista
    attr_accessor :head, :tail
    
    def push_head(x)
        if(@head == nil)
            @head = Node.new(x, nil, nil)
            @tail = @head
        else
            nuevo = Node.new(x, nil, nil)
            nuevo.next= @head
            @head.prev = nuevo
            @head = nuevo
        end
    end
    
    def push_tail(x)
        if(@tail == nil)
            @tail = Node.new(x, nil, nil)
            @head = @tail
        else
            nuevo = Node.new(x, nil, nil)
            nuevo.prev = @tail
            @tail.next = nuevo
            @tail = nuevo
        end
    end
    
    def push(x)
        x.each{
            |i| push_tail(i)
        }
    end
    
    def pop_head()
        if(@head == nil)
            return nil
        end
        
        x = @head
        @head = @head.next
        if(@head == nil)
            @tail = nil
        else
            @head.prev = nil
            x.next = nil
        end
        x.value
    end
    
    def pop_tail()
        if(@tail == nil)
            return nil
        end
        
        x = @tail
        @tail = @tail.prev
        if(@tail == nil)
            @head = nil
        else
            @tail.next = nil
            x.prev = nil
        end
        x.value
    end
end