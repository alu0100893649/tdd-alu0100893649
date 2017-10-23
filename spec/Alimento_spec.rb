require "spec_helper"

RSpec.describe Alimento do
  it "has a version number" do
    expect(Alimento::VERSION).not_to be nil
  end
  context "Elementos básicos del alimento" do
    it "Tiene un nombre" do
      expect(Alimento.new("manzana", 10, 10, 10).nombre).to eq("manzana")
    end
    it "Tiene un atributo glucidos" do
      expect(Alimento.new("manzana", 10, 10, 10).glucidos).to eq(10)
    end
    it "Tiene un atributo proteinas" do
      expect(Alimento.new("manzana", 10, 10, 10).proteinas).to eq(10)
    end
    it "Tiene un atributo lipidos" do
      expect(Alimento.new("manzana", 10, 10, 10).lipidos).to eq(10)
    end
  end
  
end
