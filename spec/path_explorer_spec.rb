require 'constants'
require 'graph'
require 'path_explorer'

RSpec.describe PathExplorer do

	it "can return the number of trips along 0 edge" do

		graph = Graph.new

		path_explorer = PathExplorer.new(graph)

		expect(path_explorer.num_trips('A', 'A')).to eq 0

	end

	it "can return the number of trips along 1 edge" do

		graph = Graph.new
		graph.add_edge('A', 'B', 5)

		path_explorer = PathExplorer.new(graph)

		expect(path_explorer.num_trips('A', 'B')).to eq 1

	end

	it "can return the number of trips along 2 edges" do

		graph = Graph.new
		graph.add_edge('A', 'B', 5)
		graph.add_edge('B', 'A', 5)

		path_explorer = PathExplorer.new(graph)

		expect(path_explorer.num_trips('A', 'A')).to eq 1

	end

	it "can return the number of trips along 3 edges" do

		graph = Graph.new
		graph.add_edge('A', 'B', 5)
		graph.add_edge('B', 'A', 5)
		graph.add_edge('A', 'C', 8)

		path_explorer = PathExplorer.new(graph)

		expect(path_explorer.num_trips('A', 'C')).to eq 1

	end

	it "can return the number of trips along circular route with max stops" do

		graph = Graph.new
		graph.add_edge('A', 'B', 5)
		graph.add_edge('B', 'A', 5)

		path_explorer = PathExplorer.new(graph)

		expect(path_explorer.num_trips('A', 'A', 4, PathExplorer::MaxStops)).to eq 2

	end

	it "can return the number of trips along circular route with exact stops" do

		graph = Graph.new
		graph.add_edge('A', 'B', 5)
		graph.add_edge('B', 'A', 5)

		path_explorer = PathExplorer.new(graph)

		expect(path_explorer.num_trips('A', 'A', 2, PathExplorer::ExactStops)).to eq 1

	end

	it "can return the number of trips along circular route less than given distance" do

		graph = Graph.new
		graph.add_edge('A', 'B', 5)
		graph.add_edge('B', 'A', 5)

		path_explorer = PathExplorer.new(graph)

		expect(path_explorer.num_trips('A', 'A', 30, PathExplorer::MaxDistance)).to eq 3

	end

end
