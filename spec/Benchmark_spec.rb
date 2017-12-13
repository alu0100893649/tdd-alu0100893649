require "spec_helper"
require "benchmark"

RSpec.describe "Benchmark" do
    before :all do
        HLC, CYD, PYM, GRA = "Huevos, lácteos y helados", "Carnes y derivados", "Pescados y mariscos", "Alimentos grasos"
        CRB, VYH, FRU = "Alimentos ricos en carbohidratos", "Verduras y hortalizas", "Fruta"
    end
    before :each do
        huevo = AlimentoCategorizable.new("Huevo frito", HLC, 14.1, 0.0, 19.5)
        leche = AlimentoCategorizable.new("Leche vaca", HLC, 3.3, 4.8, 3.2)
        yogurt = AlimentoCategorizable.new("Yogurt", HLC, 3.8, 4.9, 3.8)
        @grupo1 = GrupoAlimenticio.new(HLC)
        @grupo1.push_alimentos([huevo, leche, yogurt])
        
        cerdo = AlimentoCategorizable.new("Cerdo", CYD, 21.5, 0.0, 6.3)
        ternera = AlimentoCategorizable.new("Ternera", CYD, 21.1, 0.0, 3.1)
        pollo  = AlimentoCategorizable.new("Pollo", CYD, 20.6, 0.0, 5.6)
        @grupo2 = GrupoAlimenticio.new(CYD)
        @grupo2.push_alimentos([cerdo, ternera, pollo])
        
        bacalao  = AlimentoCategorizable.new("Bacalao", PYM, 17.7, 0.0, 0.4)
        atun = AlimentoCategorizable.new("Atún", PYM, 21.5, 0.0, 15.5)
        salmon = AlimentoCategorizable.new("Salmón", PYM, 19.9, 0.0, 13.6)
        @grupo3 = GrupoAlimenticio.new(PYM)
        @grupo3.push_alimentos([bacalao, atun, salmon])
        
        aceite = AlimentoCategorizable.new("Aceite de oliva", GRA, 0.0, 0.2, 99.6)
        mantequilla = AlimentoCategorizable.new("Mantequilla", GRA, 0.7, 0.0, 83.2)
        chocolate = AlimentoCategorizable.new("Chocolate", GRA, 5.3, 47.0, 30.0)
        @grupo4 = GrupoAlimenticio.new(GRA)
        @grupo4.push_alimentos([aceite, mantequilla, chocolate])
        
        azucar = AlimentoCategorizable.new("Azúcar", CRB, 0.0, 99.8, 0.0)
        arroz = AlimentoCategorizable.new("Arroz", CRB, 6.8, 77.7, 0.6)
        lentejas = AlimentoCategorizable.new("Lentejas", CRB, 23.5, 52.0, 1.4)
        papas = AlimentoCategorizable.new("Papas", CRB, 2.0, 15.4, 0.1)
        @grupo5 = GrupoAlimenticio.new(CRB)
        @grupo5.push_alimentos([azucar, arroz, lentejas, papas])
        
        tomate = AlimentoCategorizable.new("Tomate", VYH, 1.0, 3.5, 0.2)
        cebolla = AlimentoCategorizable.new("Cebolla", VYH, 1.3, 5.8, 0.3)
        calabaza = AlimentoCategorizable.new("Calabaza", VYH, 1.1, 4.8, 0.1)
        @grupo6 = GrupoAlimenticio.new(VYH)
        @grupo6.push_alimentos([tomate, cebolla, calabaza])
        
        manzana = AlimentoCategorizable.new("Manzana", FRU, 0.3, 12.4, 0.4)
        platano = AlimentoCategorizable.new("Plátano", FRU, 1.2, 21.4, 0.2)
        pera = AlimentoCategorizable.new("Pera", FRU, 0.5, 12.7, 0.3)
        @grupo7 = GrupoAlimenticio.new(FRU)
        @grupo7.push_alimentos([manzana, platano, pera])
        
        @grupos = [@grupo1, @grupo2, @grupo3, @grupo4, @grupo5, @grupo6, @grupo7]
        
        @grupos.instance_eval do
            def to_s
                string = ""
                each do |x|
                    string += x
                end
                return string
            end
        end
        
        @alimentos = [ huevo, leche, yogurt, cerdo, ternera, pollo, bacalao, atun, salmon, 
                        aceite, mantequilla, chocolate, azucar, arroz, lentejas, papas, 
                        tomate, cebolla, calabaza, manzana, platano, pera ]
        
        def for_ordenation(inicial)
            array = inicial
            for i in 0..array.size 
                for j in (i + 1)..array.size-1    
                    if(array[i] > array[j]) then array[i], array[j] = array[j], array[i] end 
                end
            end
            array
        end
        
        def each_ordenation(inicial)
            array = inicial
            array.each do
                swap = false
                array.each_with_index do |a, i|
                break if i == (array.length - 1)
                if a > array[i + 1]
                    array[i],array[i + 1] = array[i + 1], array[i]
                    swap = true
                end
              end
              break if swap == false #No se realizan cambios en el vector. Está ordenado
            end
            array
        end
      
    end
    
    context "#Printing" do
        it " " do
            puts "\n"
            puts @grupos
        end
    end
    
    context "#Benchmark timing" do
        it " " do
            Benchmark.bmbm(10) do |x| #funcionamiento de benchmark
                x.report("#sort:")  { @alimentos.dup.sort }
                x.report("#for:") { for_ordenation(@alimentos.dup)}
                x.report("#each:") { each_ordenation(@alimentos.dup)}
            end
        end
    end
end