class PlatoHarvard
    attr_reader :name, :ingredients, :measures
    
    @@alimentos = {
          "huevo" => AlimentoCategorizable.new("Huevo frito", "Huevos, lácteos y helados", 14.1, 0.0, 19.5),
          "leche" => AlimentoCategorizable.new("Leche de vaca", "Huevos, lácteos y helados", 3.3, 4.8, 3.2),
          "yogurt" => AlimentoCategorizable.new("Yogurt", "Huevos, lácteos y helados", 3.8, 4.9, 3.8),
          "cerdo" => AlimentoCategorizable.new("Cerdo", "Carnes y derivados", 21.5, 0.0, 6.3),
          "ternera" => AlimentoCategorizable.new("Ternera", "Carnes y derivados", 21.1, 0.0, 3.1),
          "pollo" => AlimentoCategorizable.new("Pollo", "Carnes y derivados", 20.6, 0.0, 5.6),
          "bacalao" => AlimentoCategorizable.new("Bacalao", "Pescados y mariscos", 17.7, 0.0, 0.4),
          "atún" => AlimentoCategorizable.new("Atún", "Pescados y mariscos", 21.5, 0.0, 15.5),
          "salmón" => AlimentoCategorizable.new("Salmón", "Pescados y mariscos", 19.9, 0.0, 13.6),
          "aceite" => AlimentoCategorizable.new("Aceite de oliva", "Alimentos grasos", 0.0, 0.2, 99.6),
          "mantequilla" => AlimentoCategorizable.new("Mantequilla", "Alimentos grasos", 0.7, 0.0, 83.2),
          "chocolate" => AlimentoCategorizable.new("Chocolate", "Alimentos grasos", 5.3, 47.0, 30.0),
          "azúcar" => AlimentoCategorizable.new("Azúcar", "Alimentos ricos en carbohidratos", 0.0, 99.8, 0.0),
          "arroz" => AlimentoCategorizable.new("Arroz", "Alimentos ricos en carbohidratos", 6.8, 77.7, 0.6),
          "lentejaz" => AlimentoCategorizable.new("Lentejas", "Alimentos ricos en carbohidratos", 23.5, 52.0, 1.4),
          "papas" => AlimentoCategorizable.new("Papas", "Alimentos ricos en carbohidratos", 2.0, 15.4, 0.1),
          "tomate" => AlimentoCategorizable.new("Tomate", "Verduras y hortalizas", 1.0, 3.5, 0.2),
          "cebolla" => AlimentoCategorizable.new("Cebolla", "Verduras y hortalizas", 1.3, 5.8, 0.3),
          "calabaza" => AlimentoCategorizable.new("Calabaza", "Verduras y hortalizas", 1.1, 4.8, 0.1),
          "manzana" => AlimentoCategorizable.new("Manzana", "Fruta", 0.3, 12.4, 0.4),
          "plátano" => AlimentoCategorizable.new("Plátano", "Fruta", 1.2, 21.4, 0.2),
          "pera" => AlimentoCategorizable.new("Pera", "Fruta", 0.5 ,12.7, 0.3)
        }
        
    @@medidas = [["/piezas? pequeña/",   2],
                ["/pieza/"          ,   4],
                ["/taza/"           , 0.6],
                ["/cuchara/"        , 0.4],
                ["/cuchar[o|ó]n/"   , 0.8],
                ["/vaso/"           , 1.2],
                ["/gramo[s]?/"      ,   1],
                ["/pizca/"          , 0.5]]
    
    def initialize(name)
        @name = name
        @ingredients = []
        @measures = []
    end
end