
load './struct/components/Node.rb'
load './struct/Tree.rb'
load './struct/components/OrderTree.rb'
load './struct/components/AddTree.rb'
load './struct/components/SearchTree.rb'
load './struct/components/RemoveTree.rb'
load './struct/components/DrawTree.rb'

myTree = Tree.new(nil,lambda do |x,y|  #inicializamos arbol binario
    return  ( x > y.getData() )? 1 : ( ( x == y.getData())? 0 : -1 )   
end)

puts "\nAGREGAR ELEMENTOS AL ARBOL ...."

for i in [50,20,70,10,14,80,92,100] do 
    puts "Agregamos elemento : [#{i}]" 
    myTree.add(i) 
end

puts "\nRECORRIDOS DEL ARBOL...."
puts "\t PRE ORDER"
myTree.preOrder(lambda do |x| 
    puts"#{x.getData()}" 
end)

puts "\nELIMINAR ELEMENTOS DEL ARBOL"

Eliminate = 79

puts "Eliminar > #{Eliminate}"
if myTree.delete(79)
    puts "Nodo removido"
else
    puts "El nodo no se encuentra en el árbol"
end

=begin
=end
puts "\nDIBUJADO DE ARBOL BINARIO"
myTree.draw()