require 'constants'
require 'graph'
require 'path_searcher'

RSpec.describe PathSearcher do

	it "can return shortest path when zero vertices" do

		shortest_paths = Hash.new

		graph = Graph.new

		path_searcher = PathSearcher.new(graph)

		expect(path_searcher.shortest_paths('A')).to eq shortest_paths

	end

	it "can return shortest path when 1 vertex" do

		shortest_paths = Hash.new
		shortest_paths['A'] = Constants::MAX_DISTANCE;

		graph = Graph.new
		graph.add_vertex('A')

		path_searcher = PathSearcher.new(graph)

		expect(path_searcher.shortest_paths('A')).to eq shortest_paths

	end

	it "can return shortest path when 2 vertices" do

		shortest_paths = Hash.new
		shortest_paths['A'] = Constants::MAX_DISTANCE;
		shortest_paths['B'] = 5;

		graph = Graph.new
		graph.add_vertex('A')
		graph.add_vertex('B')
		graph.add_edge('A', 'B', 5)

		path_searcher = PathSearcher.new(graph)

		expect(path_searcher.shortest_paths('A')).to eq shortest_paths

	end

	it "can return shortest path when 3 vertices" do

		shortest_paths = Hash.new
		shortest_paths['A'] = Constants::MAX_DISTANCE;
		shortest_paths['B'] = 5;
		shortest_paths['C'] = 9;

		graph = Graph.new
		graph.add_vertex('A')
		graph.add_vertex('B')
		graph.add_edge('A', 'B', 5)
		graph.add_edge('B', 'C', 4)

		path_searcher = PathSearcher.new(graph)

		expect(path_searcher.shortest_paths('A')).to eq shortest_paths

	end

	it "can return shortest path when choice of paths" do

		shortest_paths = Hash.new
		shortest_paths['A'] = Constants::MAX_DISTANCE;
		shortest_paths['B'] = 5;
		shortest_paths['C'] = 8;

		graph = Graph.new
		graph.add_vertex('A')
		graph.add_vertex('B')
		graph.add_edge('A', 'B', 5)
		graph.add_edge('B', 'C', 4)
		graph.add_edge('A', 'C', 8)

		path_searcher = PathSearcher.new(graph)

		expect(path_searcher.shortest_paths('A')).to eq shortest_paths

	end

	it "can return shortest path when unconnected vertices" do

		shortest_paths = Hash.new
		shortest_paths['A'] = Constants::MAX_DISTANCE;
		shortest_paths['B'] = 5;
		shortest_paths['C'] = 8;
		shortest_paths['D'] = Constants::MAX_DISTANCE;

		graph = Graph.new
		graph.add_vertex('D')
		graph.add_edge('A', 'B', 5)
		graph.add_edge('B', 'C', 4)
		graph.add_edge('A', 'C', 8)

		path_searcher = PathSearcher.new(graph)

		expect(path_searcher.shortest_paths('A')).to eq shortest_paths

	end

	it "can return shortest path between two vertices" do

		graph = Graph.new
		graph.add_vertex('D')
		graph.add_edge('A', 'B', 5)
		graph.add_edge('B', 'C', 4)
		graph.add_edge('A', 'C', 8)

		path_searcher = PathSearcher.new(graph)

		expect(path_searcher.shortest_path('A', 'B')).to eq 5

	end

	it "doesn't get caught in a loop between 3 vertices" do

		graph = Graph.new
		graph.add_vertex('D')
		graph.add_edge('A', 'B', 5)
		graph.add_edge('B', 'C', 4)
		graph.add_edge('C', 'A', 5)

		path_searcher = PathSearcher.new(graph)

		expect(path_searcher.shortest_path('A', 'C')).to eq 9

	end

	it "don't consider the initial vertex visited until revisited" do

		graph = Graph.new
		graph.add_vertex('D')
		graph.add_edge('A', 'B', 5)
		graph.add_edge('B', 'C', 4)
		graph.add_edge('C', 'A', 5)

		path_searcher = PathSearcher.new(graph)

		expect(path_searcher.shortest_path('A', 'A')).to eq 14

	end

end
