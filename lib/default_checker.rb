

class DefaultChecker

	def should_visit? (vertex, current_path)
		return true
	end

	def did_visit (vertex)
		# Do nothing
	end

	def valid_path? (path)
		return true
	end

	def finished_exploring? (vertices_to_explore)
		return false
	end

end
