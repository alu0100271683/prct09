module Bib
    Nodo = Struct.new(:value, :next, :previus)
    
    class Nodo
        include Comparable
        def <=> (other)
            @value <=> other.value
        end
    end
   
    class Lista
        include Enumerable
        def initialize
            @head = nil
            @tail = nil
        end
    
        def add(nodo2)
            nodo = Nodo.new(nil, nil, nil)
            
            if(nodo2.class == Nodo)
                nodo = nodo2
            else
                nodo.value = nodo2
            end
            
            nodo.previus = @tail
            if(@head.nil?)
                @head = nodo
                @tail = nodo
            end
            if(!@head.nil?)
                @tail.next = nodo
            end
            @tail = nodo
        end
        def add_collection(array)
            array.each do |nodo|
                self.add(nodo)
            end
        end
        def head
            @head
        end
        def tail
            @tail
        end
        def del_head
            nodo = Nodo.new()
            nodo2 = Nodo.new()
            nodo = @head
            nodo2 = @head
            @head.previus = nil
            @head = nodo.next
            if(!@head.next.nil?)
                @head.next = nodo.next.next
            end
            nodo2.value
        end
        def to_s()
            nodo = @head
            while (nodo != nil) do
                "#{nodo.value}"
                nodo = nodo.next
            end
        end
        def each()
            current_node = @head
            
            while current_node != nil
                yield current_node.value
                current_node = current_node.next
            end
        end
    end
end