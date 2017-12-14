require "spec_helper"

RSpec.describe PlatoHarvard do
  before :all do
      @plato = PlatoHarvard.new("Plato de Ejemplo")
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