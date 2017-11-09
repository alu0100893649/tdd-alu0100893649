class GrupoAlimenticio < Lista
    attr_reader :categoria

    def initialize(categoria)
        super()
        @categoria = categoria
    end
end