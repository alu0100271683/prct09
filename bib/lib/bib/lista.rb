module Bib
    Nodo = Struct.new(:value, :next, :previus)
   
    class Lista
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
            nodo = Nodo.new(nil, nil, nil)
            nodo2 = Nodo.new(nil, nil, nil)
            nodo = @head
            nodo2 = @head
            @head.previus = nil
            @head = nodo.next
            if(!@head.next.nil?)
                @head.next = nodo.next.next
            end
            nodo2.value
        end
    end
end