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

	it "can return the number of trips along 0 edge" do

		graph = Graph.new
		expect(graph.num_trips('A', 'A')).to eq 0

	end

	it "can return the number of trips along 1 edge" do

		graph = Graph.new
		graph.add_edge('A', 'B', 5)
		expect(graph.num_trips('A', 'B')).to eq 1

	end

	it "can return the number of trips along 2 edges" do

		graph = Graph.new
		graph.add_edge('A', 'B', 5)
		graph.add_edge('B', 'A', 5)
		expect(graph.num_trips('A', 'A')).to eq 1

	end

	it "can return the number of trips along 3 edges" do

		graph = Graph.new
		graph.add_edge('A', 'B', 5)
		graph.add_edge('B', 'A', 5)
		graph.add_edge('A', 'C', 8)
		expect(graph.num_trips('A', 'C')).to eq 1

	end

	it "can return the number of trips along circular route with max stops" do

		graph = Graph.new
		graph.add_edge('A', 'B', 5)
		graph.add_edge('B', 'A', 5)
		expect(graph.num_trips('A', 'A', 4, Graph::MaxStops)).to eq 2

	end

	it "can return the number of trips along circular route with exact stops" do

		graph = Graph.new
		graph.add_edge('A', 'B', 5)
		graph.add_edge('B', 'A', 5)
		expect(graph.num_trips('A', 'A', 2, Graph::ExactStops)).to eq 1

	end

	it "can return the number of trips along circular route less than given distance" do

		graph = Graph.new
		graph.add_edge('A', 'B', 5)
		graph.add_edge('B', 'A', 5)
		expect(graph.num_trips('A', 'A', 30, Graph::MaxDistance)).to eq 3

	end

end
