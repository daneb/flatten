require "spec_helper"

RSpec.describe Flatten do
  let(:fl) { Class.new { extend Flatten }}

  before :all do
    
  end

  it "has a version number" do
    expect(Flatten::VERSION).not_to be nil
  end

  it "flattens a simple nested array" do
    simple_array = [1, [2, [3]], 4]
    result = [1, 2, 3, 4]
    expect(fl.flatten_array(simple_array)).to eq(result)
  end
end
