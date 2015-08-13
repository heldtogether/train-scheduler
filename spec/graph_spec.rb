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

	it "can return distance to vertex 2 edge away" do

		graph = Graph.new
		graph.add_edge('A', 'B', 5)
		graph.add_edge('B', 'C', 4)
		expect(graph.path_distance(['A', 'B', 'C'])).to eq 9

	end

	it "can return distance to vertex 4 edges away" do

		graph = Graph.new
		graph.add_edge('A', 'E', 7)
		graph.add_edge('E', 'B', 3)
		graph.add_edge('B', 'C', 4)
		graph.add_edge('C', 'D', 8)
		expect(graph.path_distance(['A', 'E', 'B', 'C', 'D'])).to eq 22

	end

	it "can return 'NO SUCH ROUTE' if no route exists" do

		graph = Graph.new
		expect(graph.path_distance(['A', 'B'])).to eq 'NO SUCH ROUTE'

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

	it "can return shortest path when zero vertices" do

		shortest_paths = Hash.new

		graph = Graph.new
		expect(graph.shortest_paths('A')).to eq shortest_paths

	end

	it "can return shortest path when 1 vertex" do

		shortest_paths = Hash.new
		shortest_paths['A'] = 0;

		graph = Graph.new
		graph.add_vertex('A')
		expect(graph.shortest_paths('A')).to eq shortest_paths

	end

	it "can return shortest path when 2 vertices" do

		shortest_paths = Hash.new
		shortest_paths['A'] = 0;
		shortest_paths['B'] = 5;

		graph = Graph.new
		graph.add_vertex('A')
		graph.add_vertex('B')
		graph.add_edge('A', 'B', 5)
		expect(graph.shortest_paths('A')).to eq shortest_paths

	end

	it "can return shortest path when 3 vertices" do

		shortest_paths = Hash.new
		shortest_paths['A'] = 0;
		shortest_paths['B'] = 5;
		shortest_paths['C'] = 9;

		graph = Graph.new
		graph.add_vertex('A')
		graph.add_vertex('B')
		graph.add_edge('A', 'B', 5)
		graph.add_edge('B', 'C', 4)
		expect(graph.shortest_paths('A')).to eq shortest_paths

	end

	it "can return shortest path when choice of paths" do

		shortest_paths = Hash.new
		shortest_paths['A'] = 0;
		shortest_paths['B'] = 5;
		shortest_paths['C'] = 8;

		graph = Graph.new
		graph.add_vertex('A')
		graph.add_vertex('B')
		graph.add_edge('A', 'B', 5)
		graph.add_edge('B', 'C', 4)
		graph.add_edge('A', 'C', 8)
		expect(graph.shortest_paths('A')).to eq shortest_paths

	end

	it "can return shortest path when unconnected vertices" do

		shortest_paths = Hash.new
		shortest_paths['A'] = 0;
		shortest_paths['B'] = 5;
		shortest_paths['C'] = 8;
		shortest_paths['D'] = Graph::MAX;

		graph = Graph.new
		graph.add_vertex('D')
		graph.add_edge('A', 'B', 5)
		graph.add_edge('B', 'C', 4)
		graph.add_edge('A', 'C', 8)
		expect(graph.shortest_paths('A')).to eq shortest_paths

	end

end
