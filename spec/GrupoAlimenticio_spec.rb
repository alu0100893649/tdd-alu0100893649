require "spec_helper"

RSpec.describe GrupoAlimenticio do
  before :all do
      @list1 = GrupoAlimenticio.new("HLH")
  end
  
  it "has a version number" do
    expect(GrupoAlimenticio::VERSION).not_to be nil
  end
  context "Grupo Alimenticio - Lista categórica de alimentos" do
    it "tiene cabeza y cola" do
        expect(@list1).to have_attributes(:head => nil, :tail => nil)
    end
    
    it "puede insertar un nodo por la cabeza" do
        @list1.push_head(15)
        expect(@list1.head.value).to eq(15)
    end
    it "puede insertar un nodo por la cola" do
        @list1.push_tail(10)
        expect(@list1.tail.value).to eq(10)
    end
    
    it "puede insertar varios nodos" do
        @list1.push([1,2,3])
        expect(@list1.head.value).to eq(1)
        expect(@list1.head.next.value).to eq(2)
        expect(@list1.head.next.next.value).to eq(3)
    end
    
    it "puede extraer el nodo de la cabeza" do
        expect(@list1.pop_head).to be_nil
        @list1.push_head(5)
        expect(@list1.pop_head).to eq(5)
    end
    
    it "puede extraer el nodo de la cola" do
        expect(@list1.pop_tail).to be_nil
        @list1.push_head(10)
        expect(@list1.pop_tail).to eq(10)
    end
  end
end