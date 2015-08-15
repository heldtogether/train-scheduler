require 'graph'
require 'max_path_distance_checker'

RSpec.describe MaxPathDistanceChecker do

	it "accepts paths that are less than the max length" do

		graph = Graph.new
		graph.add_edge('A', 'B', 5)

		checker = MaxPathDistanceChecker.new(graph)

		expect(checker.valid_path?(['A'], 10)).to eq true

	end

	it "accepts paths that are the max length" do

		graph = Graph.new
		graph.add_edge('A', 'B', 5)

		checker = MaxPathDistanceChecker.new(graph)

		expect(checker.valid_path?(['A', 'B'], 5)).to eq true

	end

	it "doesn't accept paths are more than the max length" do

		graph = Graph.new
		graph.add_edge('A', 'B', 5)

		checker = MaxPathDistanceChecker.new(graph)

		expect(checker.valid_path?(['A', 'B'], 1)).to eq false

	end

	it "doesn't declare finished exploring by default" do

		graph = Graph.new

		checker = MaxPathDistanceChecker.new(graph)

		expect(checker.finished_exploring?).to eq false

	end

	it "does declare finished exploring once exact path length reached" do

		graph = Graph.new
		graph.add_edge('A', 'B', 5)

		checker = MaxPathDistanceChecker.new(graph)
		checker.valid_path?(['A', 'B'], 1)

		expect(checker.finished_exploring?).to eq true

	end

end
