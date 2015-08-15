require 'constants'
require 'graph'
require 'path_explorer'

RSpec.describe PathExplorer do

	it "can find all vertices in 0-edge graph" do

		graph = Graph.new

		path_explorer = PathExplorer.new(graph)

		expect(path_explorer.explore('A')).to eq ['A']

	end


end
