require "spec_helper"

RSpec.describe Alimento do
  before :all do
    @manzana = Alimento.new("manzana", 10, 10, 10)
    @pera = Alimento.new("pera", 1, 2, 3)
    
    @compota = Alimento.new("Compota", 4, 5, 6)
    @grcompota = [[6.7, 6.5, 6.8, 6.9, 7.0, 7.1, 6.9, 6.9, 6.9, 6.7, 6.9, 7.3, 7.0, 7.0, 7.2, 7.1, 6.8, 7.2 ,7.3 ,7.0 ,6.8 ,6.7, 6.8, 6.7, 6.9],[4.6 ,4.8 ,5.3, 5.6, 6.1, 6.5, 6.6, 7.0, 7.0, 6.8, 6.4, 6.3, 6.1, 6.1, 6.2, 6.0, 6.1, 6.1 ,6.2, 6.3, 6.4 ,6.1 ,6.1 ,5.7 ,5.9]]
    @glcompota = [[4.9 ,5.3 ,5.9 ,6.7 ,7.2 ,7.6 ,8.0 ,8.2, 8.2 ,8.4 ,8.3 ,8.3 ,8.0 ,7.5, 7.1, 6.8 ,6.8 ,6.9, 6.8, 6.3 ,6.2 ,6.3 ,6.2 ,6.3, 6.1],[6.3, 5.4, 5.6, 5.7, 6.5, 7.4, 7.9, 7.4, 7.7, 7.9, 7.9, 7.8, 7.8, 7.8, 8.0, 8.5, 9.4 ,10.8 ,10.5, 9.1, 8.9, 8.3, 7.7, 7.6 ,7.5]]
    IGCOMPOTA = 54.499780077077745
  end
  
  it "has a version number" do
    expect(Alimento::VERSION).not_to be nil
  end
  
  context "Elementos básicos del alimento" do
    it "Tiene los atributos nombre, proteinas, glucidos y lipidos" do
      expect(@manzana).to have_attributes(:nombre => "manzana", :proteinas => 10, :glucidos => 10, :lipidos => 10)
    end
    it "Es comparable" do
      expect(@manzana > @pera).to be(true)
      expect(@pera < @manzana).to be(true)
      expect(@manzana >= @pera).to be(true)
      expect(@pera <= @manzana).to be(true)
      expect(@manzana == @manzana).to be(true)
    end
    it "Tiene un método para obtener el nombre" do
      expect(@manzana.nombre).to eq("manzana")
    end
    it "Tiene un método para obtener el glucidos" do
      expect(@manzana.glucidos).to eq(10)
    end
    it "Tiene un método para obtener el proteinas" do
      expect(@manzana.proteinas).to eq(10)
    end
    it "Tiene un método para obtener el lipidos" do
      expect(@manzana.lipidos).to eq(10)
    end
  end
  context "Índice de Glucosa del alimento" do
  	it "Cálcula el índice de glucosa mendiante programación funcional" do
  	  expect(@compota.calculate_index(@grcompota, @glcompota)).to eq(IGCOMPOTA)
  	end
  end
  context "Formateo del alimento" do
    it "Tiene un método para obtener el alimento formateado" do
      expect(@manzana.to_s).to eq("%-20s %-10.2f %-10.2f %-10.2f" % [@manzana.nombre, @manzana.proteinas, @manzana.glucidos,  @manzana.lipidos])
    end
  end
  context "Valor energético" do
    it "Tiene un método para obtener el valor energético del alimento" do
      expect(@pera.kcal).to eq(2*4 + 1*4 + 3*9)
    end
  end
end
