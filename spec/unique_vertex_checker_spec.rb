require 'graph'
require 'unique_vertex_checker'

RSpec.describe UniqueVertexChecker do

	it "can visit undiscovered vertex" do

		graph = Graph.new

		checker = UniqueVertexChecker.new(graph)

		expect(checker.should_visit?('A')).to eq true

	end

end
