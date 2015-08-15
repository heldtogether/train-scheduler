require_relative 'graph'

class ExactPathLengthChecker

	def initialize (graph, path_length)

		@graph = graph
		@path_length = path_length
		@finished_exploring = false

	end

	def should_visit? (vertex)

		return true

	end

	def did_visit (vertex)

		# Do nothing

	end

	def valid_path? path

		if path.count == @path_length

			return true

		else

			@finished_exploring = true

			return false

		end

	end

	def finished_exploring?

		return @finished_exploring

	end

end
