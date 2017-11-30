# Representación de un alimento según sus calorías aportadas y la cantidad de glucidos, proteinas y lipidos contenidos
# 
# @author Sebastian Jose Diaz Rodriguez
# @since 1.0.0
# @attr_reader String nombre Nombre del alimento
# @attr_reader Number glucidos glucidos contenidos en el alimento
# @attr_reader Number proteinas preoteinas contenidos en el alimento
# @attr_reader Number lipidos lipidos contenidos en el alimento
class Alimento
    include Comparable
    attr_reader :nombre, :glucidos, :proteinas, :lipidos
    
    # Constructor de Alimento
    # @param [String] nombre nombre del alimento
    # @param [Number] glucidos glucidos contenidos en el alimento
    # @param [Number] proteinas preoteinas contenidos en el alimento
    # @param [Number] lipidos lipidos contenidos en el alimento
    #
    # @return [Alimento] Devuelve el objeto creado de clase Alimento
    def initialize(nombre, glucidos, proteinas, lipidos)
        @nombre = nombre
        @glucidos = glucidos
        @proteinas = proteinas
        @lipidos = lipidos
    end
    
    # Método para calcular el índice glucémico
    # @param [Array<Float>] alimento vector con los datos de glucosa tras la ingesta del alimento por cada individuo en el experimento
    # @param [Array<Float>] glucosa vector con los datos de glucosa tras la ingesta de 50gr de glucosa por cada individuo en el experimento
    #
    # @return [Float] Devuelve el índice glucémico dado el experimento
    def calculate_index(alimento, glucosa)
		acum = alimento.map{|data| data.map.with_index(1){|x, a| if(a >= data.length) then 0 else (((data[a] - data[0]) + (data[a - 1] - data[0])) /2)*5 end } }
		aibc = acum.map{ |x| x.reduce{|i, a| i + a } }
		
		acum = []
		
		acum = glucosa.map{|data| data.map.with_index(1){|x, a| if(a >= data.length) then 0 else (((data[a] - data[0]) + (data[a - 1] - data[0])) /2)*5 end } }
		aibcgl = acum.map{ |x| x.reduce{|i, a| i + a } }

		igind = aibc.map.with_index { |a, x| ((aibc[x] / aibcgl[x]) * 100) }
	    
	    igind.reduce(:+) / igind.length
    end
    
    # Convierte el objeto en un String
    # @return [String] descripción del alimento en una cadena de caracteres
    def to_s
        x = "%-20s %-10.2f %-10.2f %-10.2f" % [nombre, proteinas, glucidos,  lipidos]
        return x
    end
    
    # Constructor de Alimento
    # @return [Number] Devuelve el valor calórico del alimento representado
    def kcal
        @proteinas * 4 + @glucidos * 4 + @lipidos * 9
    end
    
    # Constructor de Alimento
    # @param [Alimento] other otro objeto de clase Alimento
    # @return [Number] Devuelve la relación de comparación entre el objeto que invoca el método y el otro objeto Alimento
    def <=>(other)
        kcal <=> other.kcal
    end
end