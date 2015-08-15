

class DefaultChecker

	def should_visit? (vertex, current_path, path_length)
		return true
	end

	def did_visit (vertex)
		# Do nothing
	end

	def valid_path? (path, unused)
		return true
	end

	def finished_exploring? (vertices_to_explore, unused)
		return false
	end

end
