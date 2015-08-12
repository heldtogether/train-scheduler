require 'graph'

RSpec.describe Graph do

	it "is created with no vertices" do

		vertices = Hash.new

		graph = Graph.new
		expect(graph.vertices).to eq vertices

	end

end
