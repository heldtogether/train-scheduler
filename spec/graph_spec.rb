require 'graph'

RSpec.describe Graph do

	it "is created with no vertices" do

		vertices = Hash.new

		graph = Graph.new
		expect(graph.vertices).to eq vertices

	end

	it "can add a vertex" do

		vertices = Hash.new
		vertices['A'] = {'B' => 5}

		graph = Graph.new
		graph.add_vertex('A', 'B', 5)
		expect(graph.vertices).to eq vertices

	end

end
