require 'graph'

RSpec.describe Graph do

	it "is created with no vertices" do

		vertices = Hash.new

		graph = Graph.new
		expect(graph.vertices).to eq vertices

	end

	it "can add an edge" do

		vertices = Hash.new
		vertices['A'] = {'B' => 5}

		graph = Graph.new
		graph.add_vertex('A', 'B', 5)
		expect(graph.vertices).to eq vertices

	end

	it "can add 2 edges" do

		vertices = Hash.new
		vertices['A'] = {'B' => 5}
		vertices['B'] = {'C' => 4}

		graph = Graph.new
		graph.add_vertex('A', 'B', 5)
		graph.add_vertex('B', 'C', 4)
		expect(graph.vertices).to eq vertices

	end

	it "can add 2 edges to a single vertex" do

		vertices = Hash.new
		vertices['A'] = {'B' => 5, 'D' => 5}

		graph = Graph.new
		graph.add_vertex('A', 'B', 5)
		graph.add_vertex('A', 'D', 5)
		expect(graph.vertices).to eq vertices

	end

end
