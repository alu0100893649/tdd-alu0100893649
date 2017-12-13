require "spec_helper"

RSpec.describe PlatoHarvard do
  before :all do
  end
  
  it "has a version number" do
    expect(PlatoHarvard::VERSION).not_to be nil
  end
end