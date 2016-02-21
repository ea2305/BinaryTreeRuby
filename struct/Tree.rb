#author : Elihu Alejandro Cruz Albores
#version 1.0.5
#Estructura basica de un arbol binario
class Tree < Node
    #recorridos del arbol
    
    #Constructor por defecto
    def initialize(root = nil,compare = lambda{|node| node.getData()})
        @root = root
        @compare = compare
        @level = 0
        @orderMethods = OrderTree.new(@root) ##Metodos de recorridos
        @addMethods = AddTree.new(@root,@compare) ##Metodos de agregado
        @searchMethods = SearchTree.new(@root,@compare) ## Metodos de busqueda en arbol
        @removeMethods = RemoveTree.new(@root,@compare) ##Metodos para remover elementos
        @drawMethods = DrawTree.new(@root,@compare)
    end
    
    #Inicializa el valor de la raiz
    def setRoot(root = nil)
        @root = root
    end
    
    #Asigna nodo en la posicion izquierda
    def setLeft(nodeCurrent, nodeLeft)
        return nodeCurrent.setLeft(nodeLeft)
    end
        
    #Asigna un nodo en la direccion derecha
    def setRight(nodeCurrent, nodeRight)
        return nodeCurrent.setRight(nodeRight)
    end
    
#Altura del arbol
    def getLevel()
        tree_level(@root,0)
        return @level
    end

    def tree_level(node,count)
        if node == nil
            count -= 1
        else
            @level = (count > @level)? count : @level
            tree_level(node.getLeft(), count += 1)
            count -= 1 ##Disminuye la posicion del nodo
            tree_level(node.getRight(), count +=1)
        end
    end
#Fin de altura del arbol
    
#Recorridos de arbol
    def preOrder(instruction)
        @orderMethods.preOrder(instruction)
    end
    
    def inOrder(instruction)
        @orderMethods.inOrder(instruction)
    end
    
    def posOrder(instruction)
        @orderMethods.posOrder(instruction)
    end
    
    def levelOrder(instruction)
        @orderMethods.levelOrder(instruction)
    end
#Fin de recorridos del arbol
        
#Agregar al arbol completo
#Metodo de insercion por comparacion de nodo
#Recivomos el calor a agregar, con la funcion lambda para evaluar el valor
#Compare : Lamda con metodo de comparacionAgr	
        
    def add(value)
        @addMethods.add(value)
    end
    
     def addInNode(value,node)
        @addMethods.addInNode(value,node)
     end
#Fin de metodos de agregar al arbol

##Inicia metodo de busqueda en el arbol

    def search(value)
        return @searchMethods.searchAtTree(value, @root)
    end
    
    ##Busca elmento en todo el arbol y retorna la ruta del nodo en caso de existir
    # Recive el valor a buscar
    #Un lambda para manejo del contenido del nodo y sub clases
    def searchCode(search,instruction)
        @searchMethods.searchCode(search,instruction)
    end

#Remover nodos del arbol
    
    ##Elimina un nodo del arbol binario
    def delete(value)
        if search(value)
            return @removeMethods.delete(value)
        else
            return false
        end
    end
    
   def draw()
       @drawMethods.draw(@root, getLevel())
   end

end