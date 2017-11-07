require "spec_helper"

RSpec.describe Lista do
  it "has a version number" do
    expect(Lista::VERSION).not_to be nil
  end
  
  context "Nodo" do
    it "tiene atributos value, next y prev" do
        expect(Node.new(15, nil, nil)).to have_attributes(:value => 15, :next => nil, :prev => nil)
    end
  end
  
end