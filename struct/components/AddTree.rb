class AddTree
    
    def initialize(root = nil, compare = lambda do |node| node.getData() end)
        @root = root
        @compare = compare
    end

    def add(value)
        puts "in class"     
        puts @root.getData()     
        addInNode(value, @root)     
    end
    
    #Agregar al nodo por gerarqui da valor
    def addInNode(value,node)
        temp_compare = @compare.call(value, node)
        
        #Verificamos que el arbol no cuente con elementos repetidos.
        if temp_compare == 0
            return
        end
    
        if temp_compare > 0 ##Ejecuta la lambda de comparacion
            if node.getRight() == nil
                node.setRight(Node.new(value))
            else    
                addInNode(value, node.getRight())
            end
        else
            if node.getLeft() == nil
                node.setLeft(Node.new(value))
            else    
                addInNode(value, node.getLeft())
            end
        end 
    end
    
    #Inicializa el valor de la raiz
    def setRoot(root = nil)
        @root = root
    end
end