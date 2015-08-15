require_relative 'graph'
require_relative 'default_checker'
require_relative 'path_measurer'

class MaxPathDistanceChecker < DefaultChecker

	def initialize (graph, path_distance)

		@graph = graph
		@path_distance = path_distance
		@path_measurer = PathMeasurer.new(graph)

	end

	def should_visit? (vertex, current_path)

		return valid_path?(current_path)

	end

	def did_visit (vertex)

		# Do nothing

	end

	def valid_path? (path)

		path_distance = @path_measurer.distance(path)

		if path_distance < @path_distance

			return true

		else

			return false

		end

	end

	def finished_exploring? (vertices_to_explore)

		possible_path_remaining = false

		vertices_to_explore.each do | vertex |

			path_distance = @path_measurer.distance(vertex[:arrival_path])

			if path_distance < @path_distance

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
