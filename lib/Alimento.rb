require "Alimento/version"

class Alimento
    attr_accessor :nombre, :glucidos
    
    def initialize(nombre, glucidos, lipidos, proteinas)
        @nombre = nombre
        @glucidos = glucidos
    end
end
