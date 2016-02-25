=begin
    Main del Arbol binario
    author : Elihu A. Cruz Albores
    version : 1.0.4
=end

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

seleccion = 0

def menuOptions() #Impresion de menu
    puts "\n\n"
    puts "---------------- MENU PRINCIPAL --------------------------------"
    puts "1.- Insertar"
    puts "2.- Buscar"
    puts "3.- Eliminar"
    puts "---------------- RECORRIDOS --------------------------------"
    puts "4.- Pre order"
    puts "5.- In order"
    puts "6.- Pos order"
    puts "7.- Level order"
    puts "8.- Dibujar"
    puts "9.- Numero de nodos"
    puts "10.- Calcular la altura del arbol"
    puts "---------------- SALIR ----------------"
    puts "11.- SALIR"
    puts "\n\n"
end

def printSeparation(n)
    puts
    for i in 0..n
        print "="
    end
    puts
end

def printData(text) #impresion y lectura de los datos
    puts text
    return gets.chomp.to_i
end

while (seleccion != 8)

    menuOptions()

    puts "SELECCIONE UNA OPCIÓN"
    seleccion = gets.chomp

    case seleccion.to_i

    when 1
        printSeparation(50)
        dato = printData("INTRODUZCA UN DATO A INSERTAR : ")
        myTree.add(dato.to_i)
        puts
        printSeparation(50)

    when 2
        printSeparation(50)
        dato = printData("INTRODUZCA UN DATO A BUSCAR : ")
        nodo = myTree.search(dato.to_i)
        if nodo  == nil
            puts "\n*** EL DATO NO SE ENCUENTRA EN EL ÁRBOL"
        else
            puts " * EL NIVEL DEL NODO ES : #{nodo.getLevel()} ."

            puts "\n*** EL DATO FUE LOCALIZADO EN EL ÁRBOL"
            if (nodo.getLeft() == nil and nodo.getRight() == nil)
                puts "ES UN HOJA !"
            else
                puts "ES UNA RAMA !"
            end
        end

        printSeparation(50)

    when 3

        printSeparation(50)
        dato = printData("INTRODUZCA UN DATO A REMOVER : ")
        if myTree.delete(dato.to_i)
            puts "NODO REMOVIDO CON EXITO :)"
        else
            puts "EL NODO SOLICITADO NO SE ENCUENTRA EN EL ARBOL :("
        end
        printSeparation(50)

    when 4 #Impresion de arbol

        printSeparation(50)
        puts "\t PRE ORDER"
        myTree.preOrder(lambda do |x|
            puts"#{x.getData()}"
        end)
        printSeparation(50)

    when 5 #Impresion de arbol

        printSeparation(50)
        puts "\t IN ORDER"
        myTree.inOrder(lambda do |x|
            puts"#{x.getData()}"
        end)
        printSeparation(50)

    when 6 #Impresion de arbol

        printSeparation(50)
        puts "\t POS ORDER"
        myTree.posOrder(lambda do |x|
            puts"#{x.getData()}"
        end)
        printSeparation(50)

    when 7 #Impresion de arbol

        printSeparation(50)
        puts "\t LEVEL ORDER"
        myTree.levelOrder(lambda do |x|
            puts"#{x.getData()}"
        end)
        printSeparation(50)

    when 8
        myTree.draw() #Imprime los datos del arbol
    when 9

        printSeparation(50)
        temp_nodes = myTree.getNodes()
        if temp_nodes > 0
            puts " NUMERO DE NODOS : #{temp_nodes}\nY UNA RAIZ"
        else
            puts " * EL ARBOL SE ENCUENTRA VACIO !"
        end
        printSeparation(50)

    when 10
        printSeparation(50)
        puts " ALTURA DEL ARBOL : #{myTree.getLevel()}"
        printSeparation(50)
    else
        break
    end
end
