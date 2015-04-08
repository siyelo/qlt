require 'spec_helper'

describe Qlt::NodesFactory do
  let(:available_solutions) {
    [
      {"zone"=>1, "type"=>"fibre1", "node_name"=>"Albury Road", "node_distance"=>"617.84305250635", "node_lat"=>"-26.128", "node_lng"=>"28.0315"},
      {"type"=>"wi_std", "highsite"=>"JHI", "distance"=>"1722", "highsite_lat"=>"-26.147403", "highsite_lng"=>"28.042114"}
    ]
  }

  it 'builds a list of nodes' do
    solutions = described_class.build(available_solutions)
    expect(solutions).to be_kind_of Array
    expect(solutions.first).to be_kind_of Qlt::FibreNode
    expect(solutions.last).to be_kind_of Qlt::WiFiNode
  end

end