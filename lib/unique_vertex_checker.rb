require_relative 'graph'
require_relative 'default_checker'

class UniqueVertexChecker < DefaultChecker

	def initialize (graph)

		@graph = graph
		@discovered_vertices = []

	end

	def should_visit? (vertex, current_path = nil)

		if ! @discovered_vertices.include? vertex

			return true

		else

			return false

		end

	end

	def did_visit (vertex)

		@discovered_vertices.push vertex

	end

	def valid_path? (path)

		return true

	end

	def finished_exploring? (vertices_to_explore)

		return false

	end

end
