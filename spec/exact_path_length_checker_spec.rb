require 'graph'
require 'exact_path_length_checker'

RSpec.describe ExactPathLengthChecker do

	it "accepts paths that are the exact length" do

		graph = Graph.new

		checker = ExactPathLengthChecker.new(graph, 1)

		expect(checker.valid_path?(['A', 'B'])).to eq true

	end

	it "doesn't accept paths that are not the exact length" do

		graph = Graph.new

		checker = ExactPathLengthChecker.new(graph, 1)

		expect(checker.valid_path?(['A', 'B', 'C'])).to eq false

	end

	it "doesn't declare finished exploring by default" do

		graph = Graph.new

		checker = ExactPathLengthChecker.new(graph, 2)

		test_vertices = [
			{
				:vertex => 'A',
				:arrival_path => ['A']
			}
		]

		expect(checker.finished_exploring?(test_vertices)).to eq false

	end

	it "does declare finished exploring once exact path length reached" do

		graph = Graph.new

		checker = ExactPathLengthChecker.new(graph, 1)

		test_vertices = [
			{
				:vertex => 'A',
				:arrival_path => ['A', 'B', 'C']
			}
		]

		expect(checker.finished_exploring?(test_vertices)).to eq true

	end

end
