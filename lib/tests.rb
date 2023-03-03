require_relative 'linked-list'

linked_list = LinkedList.new

linked_list.append(8)
linked_list.append(12)
linked_list.prepend(7)
linked_list.prepend(6)
linked_list.append(55)
linked_list.append(100)
linked_list.prepend(3)

p linked_list.to_s
p linked_list.size
p linked_list.get_head
p linked_list.get_tail
p linked_list.at(2)
linked_list.pop
linked_list.shift
p linked_list.to_s
p linked_list.contains?(55)
p linked_list.contains?(100)
p linked_list.find(30)
p linked_list.find(8)
linked_list.insert_at(2, 0)
p linked_list.to_s
linked_list.remove_at(3)
p linked_list.to_s