require_relative 'graph'
require_relative 'default_checker'

class ExactPathLengthChecker < DefaultChecker

	def initialize (graph, path_length)

		@graph = graph
		@path_length = path_length

	end

	def should_visit? (vertex, current_path)

		if current_path.count < @path_length

			return true

		else

			return false

		end
	end

	def did_visit (vertex)

		# Do nothing

	end

	def valid_path? (path)

		if path.count == @path_length+1

			return true

		else

			return false

		end

	end

	def finished_exploring? (vertices_to_explore)

		possible_path_remaining = false

		vertices_to_explore.each do | vertex |

			if vertex[:arrival_path].count < @path_length+1

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
