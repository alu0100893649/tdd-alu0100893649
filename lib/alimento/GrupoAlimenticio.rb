class GrupoAlimenticio < Lista
    attr_reader :categoria

    def initialize(categoria)
        super()
        @categoria = categoria
    end
    
    def push_alimento(x)
        if(x.is_a?(AlimentoCategorizable))
            push_head(AlimentoCategorizable.new(x.nombre, @categoria, x.glucidos, x.proteinas, x.lipidos))
        end
    end
    
    def push_alimentos(x)
        x.each do |alimento|
            if(alimento.is_a?(AlimentoCategorizable))
                push_head(AlimentoCategorizable.new(alimento.nombre, @categoria, alimento.glucidos, alimento.proteinas, alimento.lipidos))
            end
        end
    end
    
    
end