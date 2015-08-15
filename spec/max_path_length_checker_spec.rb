require 'graph'
require 'max_path_length_checker'

RSpec.describe MaxPathLengthChecker do

	it "accepts paths that are less than the max length" do

		graph = Graph.new

		checker = MaxPathLengthChecker.new(graph, 2)

		expect(checker.valid_path? ['A']).to eq true

	end

	it "accepts paths that are the max length" do

		graph = Graph.new

		checker = MaxPathLengthChecker.new(graph, 2)

		expect(checker.valid_path? ['A', 'B', 'C']).to eq true

	end

	it "doesn't accept paths are more than the max length" do

		graph = Graph.new

		checker = MaxPathLengthChecker.new(graph, 1)

		expect(checker.valid_path? ['A', 'B', 'C']).to eq false

	end

	it "doesn't declare finished exploring by default" do

		graph = Graph.new

		checker = MaxPathLengthChecker.new(graph, 2)

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

		checker = MaxPathLengthChecker.new(graph, 1)

		test_vertices = [
			{
				:vertex => 'A',
				:arrival_path => ['A', 'B']
			}
		]

		expect(checker.finished_exploring? test_vertices).to eq true

	end

end
