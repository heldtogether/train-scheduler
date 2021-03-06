require 'graph'

RSpec.describe Graph do

	it "is created with no edges" do

		edges = Hash.new

		graph = Graph.new
		expect(graph.edges).to eq edges

	end

	it "can add an edge" do

		edges = Hash.new
		edges['A'] = {'B' => 5}

		graph = Graph.new
		graph.add_edge('A', 'B', 5)
		expect(graph.edges).to eq edges

	end

	it "can add 2 edges" do

		edges = Hash.new
		edges['A'] = {'B' => 5}
		edges['B'] = {'C' => 4}

		graph = Graph.new
		graph.add_edge('A', 'B', 5)
		graph.add_edge('B', 'C', 4)
		expect(graph.edges).to eq edges

	end

	it "can add 2 edges to a single vertex" do

		edges = Hash.new
		edges['A'] = {'B' => 5, 'D' => 5}

		graph = Graph.new
		graph.add_edge('A', 'B', 5)
		graph.add_edge('A', 'D', 5)
		expect(graph.edges).to eq edges

	end

	it "can return distance to vertex 1 edge away" do

		graph = Graph.new
		graph.add_edge('A', 'D', 5)
		expect(graph.edge_distance('A', 'D')).to eq 5

	end

	it "can add 1 vertex" do

		graph = Graph.new
		graph.add_vertex('A')
		expect(graph.vertices).to eq ['A']

	end

	it "can add 2 vertices" do

		graph = Graph.new
		graph.add_edge('A', 'B', 5)
		graph.add_edge('B', 'C', 4)
		expect(graph.vertices).to eq ['A', 'B', 'C']

	end

	it "can add 3 vertices" do

		graph = Graph.new
		graph.add_edge('A', 'B', 5)
		graph.add_edge('B', 'C', 4)
		expect(graph.vertices).to eq ['A', 'B', 'C']

	end

end
