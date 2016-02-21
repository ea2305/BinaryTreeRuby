
load './struct/components/Node.rb'
load './struct/Tree.rb'
load './struct/components/OrderTree.rb'
load './struct/components/AddTree.rb'
load './struct/components/SearchTree.rb'
load './struct/components/RemoveTree.rb'
load './struct/components/DrawTree.rb'

myTree = Tree.new(Node.new(50),lambda do |x,y|  #inicializamos arbol binario
    return  ( x > y.getData() )? 1 : ( ( x == y.getData())? 0 : -1 )   
end)


for i in [10,59,70,58,11,12,100,200,13,11.5] do myTree.add(i) end


myTree.preOrder(lambda do |x| 
    puts"#{x.getData()}" 
end)

Eliminate = 79

puts "Eliminar > #{Eliminate}"
if myTree.delete(79)
    puts "Nodo removido"
else
    puts "El nodo no se encuentra en el árbol"
end

puts ">>>>>>>>"

myTree.preOrder(lambda do |x| 
    puts"#{x.getData()}" 
end)
=begin
=end
puts "DIBUJADO"
myTree.draw()