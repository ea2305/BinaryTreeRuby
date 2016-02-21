require 'gtk3'
GTK.init
load './struct/components/Node.rb'
load './struct/Tree.rb'
load './struct/components/OrderTree.rb'
load './struct/components/AddTree.rb'
load './struct/components/SearchTree.rb'
load './struct/components/RemoveTree.rb'

myTree = Tree.new(Node.new(50),lambda do |x,y|  #inicializamos arbol binario
    return  ( x > y.getData() )? 1 : ( ( x == y.getData())? 0 : -1 )   
end)


for i in [10,59,60,79] do myTree.add(i) end


myTree.preOrder(lambda do |x| 
    puts"#{x.getData()}" 
end)

Eliminate = 79

puts "Eliminar > #{Eliminate}"
myTree.delete(79).getData()

puts ">>>>>>>>"

myTree.preOrder(lambda do |x| 
    puts"#{x.getData()}" 
end)


