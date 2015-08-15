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

		expect(checker.finished_exploring?({'A' => ['A']}, 2)).to eq false

	end

	it "does declare finished exploring once exact path length reached" do

		graph = Graph.new

		checker = ExactPathLengthChecker.new(graph)
		checker.valid_path?(['A', 'B'], 1)

		expect(checker.finished_exploring?({'A' => ['A', 'B']}, 1)).to eq true

	end

end
