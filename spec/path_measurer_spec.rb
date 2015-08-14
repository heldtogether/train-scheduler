require 'graph'
require 'path_measurer'

RSpec.describe PathMeasurer do

	it "can return distance to vertex 2 edge away" do

		graph = Graph.new
		graph.add_edge('A', 'B', 5)
		graph.add_edge('B', 'C', 4)

		measurer = PathMeasurer.new(graph)

		expect(measurer.distance(['A', 'B', 'C'])).to eq 9

	end

	it "can return distance to vertex 4 edges away" do

		graph = Graph.new
		graph.add_edge('A', 'E', 7)
		graph.add_edge('E', 'B', 3)
		graph.add_edge('B', 'C', 4)
		graph.add_edge('C', 'D', 8)

		measurer = PathMeasurer.new(graph)

		expect(measurer.distance(['A', 'E', 'B', 'C', 'D'])).to eq 22

	end

	it "can return 'NO SUCH ROUTE' if no route exists" do

		graph = Graph.new

		measurer = PathMeasurer.new(graph)

		expect(measurer.distance(['A', 'B'])).to eq 'NO SUCH ROUTE'

	end

end
