require "Alimento/version"

class Alimento
    attr_accessor :nombre
    
    def initialize(nombre, glucidos, lipidos, proteinas)
        @nombre = nombre
    end

end
