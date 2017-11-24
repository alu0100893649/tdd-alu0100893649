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
    
    def calculate_index(alimento, glucosa)
		aibc = []
		aibcgl = []
		acum = 0
		
		alimento.each do |x|
			x.each_index do |a| 
				if (a  != 0) 
					acum += (((x[a] - x[0]) + (x[a - 1] - x[0])) /2)*5  
				end 
			end 
			aibc << acum
			acum = 0
		end
		
		glucosa.each do |x|
			acum = 0
			x.each_index do |a| 
				if (a  != 0) 
					acum += (((x[a] - x[0]) + (x[a - 1] - x[0])) /2)*5
				end 
			end 
			aibcgl << acum
			acum = 0
		end

		igind = []
		igind = aibc.map.with_index { |a, x| a = ((aibc[x] / aibcgl[x]) * 100) }
	    
	    igind.reduce(:+) / igind.length
    end
    
    # Convierte el objeto en un String
    # @return [String] descripción del alimento en una cadena de caracteres
    def to_s
        x = "#{nombre}: #{proteinas}g proteínas, #{glucidos}g glúcidos, #{lipidos}g lípidos"
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