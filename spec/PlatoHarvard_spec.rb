require "spec_helper"

RSpec.describe PlatoHarvard do
  before :all do
      @lentejas = PlatoHarvard.new("Lentejas con arroz, salsa de tomate, huevo y pl´atano a la plancha") do
        ingredient "tomate",
            :porciones => "2 piezas pequeñas"
        ingredient "plátano",
            :gramos => 20
        ingredient "arroz",
            :porciones => "1 taza"
        ingredient "lentejas",
            :porciones => "0.5 cucharón"
        ingredient "huevo",
            :porciones => "1 pieza"
        ingredient "aceite de oliva",
            :porciones => "0.5 cucharada"
      end
      
      @plato = PlatoHarvard.new("Plato de Ejemplo") do
      end
  end
  
  it "has a version number" do
    expect(PlatoHarvard::VERSION).not_to be nil
  end
  
  context "Has..." do
    it "#name" do
        expect(@plato).to have_attributes(:name => "Plato de Ejemplo");
    end
    it "#ingredients" do
        expect(@plato).to have_attributes(:ingredients => []);
    end
    it "#measures" do
        expect(@plato).to have_attributes(:measures => []);
    end
  end
end