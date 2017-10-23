require "spec_helper"

RSpec.describe Alimento do
  it "has a version number" do
    expect(Alimento::VERSION).not_to be nil
  end
  context "Elementos básicos del alimento" do
    it "Tiene un nombre" do
      expect(Alimento.new("manzana", 10, 10, 10).nombre).to eq("manzana")
    end
  end
  
end
