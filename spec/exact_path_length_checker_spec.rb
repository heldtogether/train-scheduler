require 'graph'
require 'exact_path_length_checker'

RSpec.describe ExactPathLengthChecker do

	it "accepts paths that are the exact length" do

		graph = Graph.new

		checker = ExactPathLengthChecker.new(graph, 1)

		expect(checker.valid_path?(['A'])).to eq true

	end

	it "doesn't accept paths that are not the exact length" do

		graph = Graph.new

		checker = ExactPathLengthChecker.new(graph, 1)

		expect(checker.valid_path?(['A', 'B'])).to eq false

	end

	it "doesn't declare finished exploring by default" do

		graph = Graph.new

		checker = ExactPathLengthChecker.new(graph, 1)

		expect(checker.finished_exploring?()).to eq false

	end

	it "does declare finished exploring once exact path length reached" do

		graph = Graph.new

		checker = ExactPathLengthChecker.new(graph, 1)
		checker.valid_path?(['A', 'B'])

		expect(checker.finished_exploring?()).to eq true

	end

end
