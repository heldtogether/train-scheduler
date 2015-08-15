require_relative 'graph'
require_relative 'path_measurer'

class MaxPathDistanceChecker

	def initialize (graph)

		@graph = graph
		@path_measurer = PathMeasurer.new(graph)

	end

	def should_visit? (vertex, current_path, path_distance_limit)

		return valid_path?(current_path, path_distance_limit)

	end

	def did_visit (vertex)

		# Do nothing

	end

	def valid_path? (path, path_distance_limit)

		path_distance = @path_measurer.distance(path)

		if path_distance <= path_distance_limit

			return true

		else

			return false

		end

	end

	def finished_exploring? (vertices_to_explore, path_distance_limit)

		possible_path_remaining = false

		vertices_to_explore.each do | vertex |

			path_distance = @path_measurer.distance(vertex[:arrival_path])

			if path_distance <= path_distance_limit

				possible_path_remaining = true

				break

			end

		end

		if possible_path_remaining

			return false

		else

			return true

		end


	end

end
