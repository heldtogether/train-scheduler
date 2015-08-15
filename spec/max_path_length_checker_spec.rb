require 'graph'
require 'max_path_length_checker'

RSpec.describe MaxPathLengthChecker do

	it "accepts paths that are less than the max length" do

		graph = Graph.new

		checker = MaxPathLengthChecker.new(graph)

		expect(checker.valid_path?(['A'], 2)).to eq true

	end

	it "accepts paths that are the max length" do

		graph = Graph.new

		checker = MaxPathLengthChecker.new(graph)

		expect(checker.valid_path?(['A', 'B'], 2)).to eq true

	end

	it "doesn't accept paths are more than the max length" do

		graph = Graph.new

		checker = MaxPathLengthChecker.new(graph)

		expect(checker.valid_path?(['A', 'B'], 1)).to eq false

	end

	it "doesn't declare finished exploring by default" do

		graph = Graph.new

		checker = MaxPathLengthChecker.new(graph)

		expect(checker.finished_exploring?({'A' => ['A']}, 2)).to eq false

	end

	it "does declare finished exploring once exact path length reached" do

		graph = Graph.new

		checker = MaxPathLengthChecker.new(graph)
		checker.valid_path?(['A', 'B'], 1)

		expect(checker.finished_exploring?({'A' => ['A', 'B']}, 2)).to eq true

	end

end
