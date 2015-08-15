require 'graph'
require 'exact_path_length_checker'

RSpec.describe ExactPathLengthChecker do

	it "accepts paths that are the exact length" do

		graph = Graph.new

		checker = ExactPathLengthChecker.new(graph)

		expect(checker.valid_path?(['A'], 1)).to eq true

	end

	it "doesn't accept paths that are not the exact length" do

		graph = Graph.new

		checker = ExactPathLengthChecker.new(graph)

		expect(checker.valid_path?(['A', 'B'], 1)).to eq false

	end

	it "doesn't declare finished exploring by default" do

		graph = Graph.new

		checker = ExactPathLengthChecker.new(graph)

		test_vertices = [
			{
				:vertex => 'A',
				:arrival_path => ['A']
			}
		]

		expect(checker.finished_exploring?(test_vertices, 2)).to eq false

	end

	it "does declare finished exploring once exact path length reached" do

		graph = Graph.new

		checker = ExactPathLengthChecker.new(graph)
		checker.valid_path?(['A', 'B'], 1)

		test_vertices = [
			{
				:vertex => 'A',
				:arrival_path => ['A', 'B']
			}
		]

		expect(checker.finished_exploring?(test_vertices, 1)).to eq true

	end

end
