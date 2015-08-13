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

end
