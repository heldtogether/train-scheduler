require_relative 'graph'
require_relative 'default_checker'

class MaxPathLengthChecker < DefaultChecker

	def initialize (graph, path_length)

		@graph = graph
		@path_length = path_length

	end

	def should_visit? (vertex, current_path)

		return valid_path?(current_path)

	end

	def did_visit (vertex)

		# Do nothing

	end

	def valid_path? (path)

		if path.count <= @path_length + 1

			return true

		else

			return false

		end

	end

	def finished_exploring? (vertices_to_explore)

		possible_path_remaining = false

		vertices_to_explore.each do | vertex |

			if vertex[:arrival_path].count < @path_length + 1

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
