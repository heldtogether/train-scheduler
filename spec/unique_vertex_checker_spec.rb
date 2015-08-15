require 'graph'
require 'unique_vertex_checker'

RSpec.describe UniqueVertexChecker do

	it "can visit undiscovered vertex" do

		graph = Graph.new

		checker = UniqueVertexChecker.new(graph)

		expect(checker.should_visit? 'A').to eq true

	end

	it "can't visit discovered vertex" do

		graph = Graph.new

		checker = UniqueVertexChecker.new(graph)
		checker.did_visit('A')

		expect(checker.should_visit? 'A').to eq false

	end

end
