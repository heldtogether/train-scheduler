require 'constants'
require 'graph'
require 'path_explorer'

RSpec.describe PathExplorer do

	it "can find all vertices in 0-edge graph" do

		expected_paths = [
			['A']
		]

		graph = Graph.new

		path_explorer = PathExplorer.new(graph)

		expect(path_explorer.explore('A')).to eq expected_paths

	end

	it "can find all vertices in 1-edge graph" do

		expected_paths = [
			['A', 'B']
		]

		graph = Graph.new
		graph.add_edge('A', 'B', 5)

		path_explorer = PathExplorer.new(graph)

		expect(path_explorer.explore('A')).to match_array expected_paths

	end

	it "can find all vertices in 2-edge graph" do

		expected_paths = [
			['A', 'B', 'C']
		]

		graph = Graph.new
		graph.add_edge('A', 'B', 5)
		graph.add_edge('B', 'C', 4)

		path_explorer = PathExplorer.new(graph)

		expect(path_explorer.explore('A')).to match_array expected_paths

	end

	it "can find all vertices in complex-edge graph" do

		expected_paths = [
			['A', 'B', 'C'],
			['A', 'D']
		]

		graph = Graph.new
		graph.add_edge('A', 'B', 5)
		graph.add_edge('B', 'C', 4)
		graph.add_edge('A', 'D', 5)

		path_explorer = PathExplorer.new(graph)

		expect(path_explorer.explore('A')).to match_array expected_paths

	end

	it "only checks paths that have reached the head if supplied" do

		expected_paths = [
			['A', 'B']
		]

		graph = Graph.new
		graph.add_edge('A', 'B', 5)
		graph.add_edge('B', 'C', 4)
		graph.add_edge('A', 'D', 5)

		path_explorer = PathExplorer.new(graph)

		expect(path_explorer.explore('A', 'B')).to match_array expected_paths

	end

end
