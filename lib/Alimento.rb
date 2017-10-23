require "Alimento/version"

class Alimento
    attr_accessor :nombre, :glucidos, :proteinas
    
    def initialize(nombre, glucidos, proteinas, lipidos)
        @nombre = nombre
        @glucidos = glucidos
        @proteinas = proteinas
    end
end
