require "Alimento/version"

class Alimento
    attr_accessor :nombre, :glucidos, :proteinas, :lipidos
    
    def initialize(nombre, glucidos, proteinas, lipidos)
        @nombre = nombre
        @glucidos = glucidos
        @proteinas = proteinas
        @lipidos = lipidos
    end
end
