require 'constants'
require 'graph'
require 'path_explorer'

RSpec.describe PathExplorer do

	it "can find all vertices in 0-edge graph" do

		graph = Graph.new

		path_explorer = PathExplorer.new(graph)

		expect(path_explorer.explore('A')).to eq ['A']

	end

	it "can find all vertices in 1-edge graph" do

		graph = Graph.new
		graph.add_edge('A', 'B', 5)

		path_explorer = PathExplorer.new(graph)

		expect(path_explorer.explore('A')).to eq ['A', 'B']

	end

	it "can find all vertices in 2-edge graph" do

		graph = Graph.new
		graph.add_edge('A', 'B', 5)
		graph.add_edge('B', 'C', 4)

		path_explorer = PathExplorer.new(graph)

		expect(path_explorer.explore('A')).to eq ['A', 'B', 'C']

	end


end
