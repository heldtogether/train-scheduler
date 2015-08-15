require 'graph'
require 'max_path_distance_checker'

RSpec.describe MaxPathDistanceChecker do

	it "accepts paths that are less than the max length" do

		graph = Graph.new
		graph.add_edge('A', 'B', 5)

		checker = MaxPathDistanceChecker.new(graph, 10)

		expect(checker.valid_path? ['A']).to eq true

	end

	it "doesn't accept paths that are the max length" do

		graph = Graph.new
		graph.add_edge('A', 'B', 5)

		checker = MaxPathDistanceChecker.new(graph, 5)

		expect(checker.valid_path? ['A', 'B']).to eq false

	end

	it "doesn't accept paths are more than the max length" do

		graph = Graph.new
		graph.add_edge('A', 'B', 5)

		checker = MaxPathDistanceChecker.new(graph, 1)

		expect(checker.valid_path? ['A', 'B']).to eq false

	end

	it "doesn't declare finished exploring by default" do

		graph = Graph.new

		checker = MaxPathDistanceChecker.new(graph, 2)

		test_vertices = [
			{
				:vertex => 'A',
				:arrival_path => ['A']
			}
		]

		expect(checker.finished_exploring? test_vertices).to eq false

	end

	it "does declare finished exploring once exact path length reached" do

		graph = Graph.new
		graph.add_edge('A', 'B', 5)

		checker = MaxPathDistanceChecker.new(graph, 1)

		test_vertices = [
			{
				:vertex => 'A',
				:arrival_path => ['A', 'B']
			}
		]

		expect(checker.finished_exploring? test_vertices).to eq true

	end

	it "visit vertices when path is less than the max distance" do

		graph = Graph.new
		graph.add_edge('A', 'B', 5)

		checker = MaxPathDistanceChecker.new(graph, 10)

		expect(checker.should_visit?('C', ['A', 'B'])).to eq true

	end

	it "doesn't visit vertices when path is greater than or equal to the max distance" do

		graph = Graph.new
		graph.add_edge('A', 'B', 5)

		checker = MaxPathDistanceChecker.new(graph, 1)

		expect(checker.should_visit?('C', ['A', 'B'])).to eq false

	end

end
