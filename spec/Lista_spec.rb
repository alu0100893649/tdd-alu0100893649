require "spec_helper"

RSpec.describe Lista do
  before :all do
    @nodo1 = Node.new(15, nil, nil)
    @list1 = Lista.new()
  end
  it "has a version number" do
    expect(Lista::VERSION).not_to be nil
  end
  
  context "Nodo" do
    it "tiene atributos value, next y prev" do
        expect(@nodo1).to have_attributes(:value => 15, :next => nil, :prev => nil)
    end
  end
  
  context "Lista" do
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
        expect(@list1.head.value).to eq(15)
        expect(@list1.head.next.value).to eq(10)
    end
  end
  
end