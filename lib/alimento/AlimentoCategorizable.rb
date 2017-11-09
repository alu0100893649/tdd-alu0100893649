class AlimentoCategorizable < Alimento
    attr_reader :categoria
    
    def initialize(nombre, categoria, glucidos, proteinas, lipidos)
        super(nombre, glucidos, proteinas, lipidos)
        @categoria = categoria
    end
    
    def to_s
        x = "#{nombre} (#{categoria}) : #{proteinas}g proteínas, #{glucidos}g glúcidos, #{lipidos}g lípidos"
        return x
    end
end