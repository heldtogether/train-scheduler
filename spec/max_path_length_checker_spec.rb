require 'graph'
require 'max_path_length_checker'

RSpec.describe MaxPathLengthChecker do

	it "accepts paths that are less than the max length" do

		graph = Graph.new

		checker = MaxPathLengthChecker.new(graph, 2)

		expect(checker.valid_path?(['A'])).to eq true

	end

	it "accepts paths that are the max length" do

		graph = Graph.new

		checker = MaxPathLengthChecker.new(graph, 2)

		expect(checker.valid_path?(['A', 'B'])).to eq true

	end

	it "doesn't accept paths are more than the max length" do

		graph = Graph.new

		checker = MaxPathLengthChecker.new(graph, 1)

		expect(checker.valid_path?(['A', 'B'])).to eq false

	end

end
