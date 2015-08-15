require_relative 'graph'

class ExactPathLengthChecker

	def initialize (graph)

		@graph = graph

	end

	def should_visit? (vertex, current_path, path_length)

		if current_path.count < path_length+1

			return true

		else

			return false

		end
	end

	def did_visit (vertex)

		# Do nothing

	end

	def valid_path? (path, path_length)

		if path.count == path_length+1

			return true

		else

			return false

		end

	end

	def finished_exploring? (vertices_to_explore, path_length)

		possible_path_remaining = false

		vertices_to_explore.each do | vertex |

			if vertex[:arrival_path].count < path_length+1

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
