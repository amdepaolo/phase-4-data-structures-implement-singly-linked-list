require_relative './node'

class LinkedList
    attr_accessor :head
  
    def initialize
      @head = nil
    end
  
    def append(node)
      if head.nil?
        self.head = node
        return
      end
  
      last_node = head
      while last_node.next_node
        last_node = last_node.next_node
      end
  
      last_node.next_node = node
    end

    def prepend(node)
        node.next_node = self.head
        @head = node
    end

    def delete_head
        if head.nil?
            return
        end

        new_head = self.head.next_node
        self.head = new_head
    end

    def delete_tail
        if head.nil?
            return
        end

        if self.head.next_node.nil?
            return self.delete_head
        end

        last_node = self.head
        second_to_last_node = self.head

        while last_node.next_node
            second_to_last_node = last_node
            last_node = last_node.next_node
        end

        second_to_last_node.next_node = nil
    end

    def add_after(index, node)
        pre_break_node = self.head
        index.times do
            pre_break_node = pre_break_node.next_node
        end
        
        if pre_break_node
            node.next_node = pre_break_node.next_node
            pre_break_node.next_node = node
        else self.append(node)
        end
    end

    def search (value)
        current_node = head
        while current_node
            if current_node.data == value
                return current_node
            else current_node = current_node.next_node
            end
        end
    end
end
