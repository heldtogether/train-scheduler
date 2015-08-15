require_relative 'graph'
require_relative 'path_measurer'

class MaxPathDistanceChecker

	def initialize (graph)

		@graph = graph
		@path_measurer = PathMeasurer.new(graph)
		@finished_exploring = false

	end

	def should_visit? (vertex)

		return true

	end

	def did_visit (vertex)

		# Do nothing

	end

	def valid_path? (path, path_distance_limit)

		path_distance = @path_measurer.distance(path)

		if path_distance <= path_distance_limit

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